
class Button {
  int x, y, w, h, v;
  char o;
  boolean hov, num; //hover

  //Constructor
  Button(int x, int y, int w, int h) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
  }

  Button asNumber(int v) {
    num=true;
    this.v=v;
    return this;
  }

  Button asOperator(char o) {
    num=false;
    this.o=o;
    return this;
  }

  //display
  void display() {
    if (num) {
      if (hov) {
        fill(195, 170, 220);
        stroke(230, 210, 250);
      } else {
        fill(230, 210, 250);
        stroke(195, 170, 220);
      }
    } else {
      if (hov) {
        fill(150, 210, 220);
        stroke(180, 230, 230);
      } else {
        fill(180, 230, 230);
        stroke(150, 210, 220);
      }
    }

    rect(x, y, w, h, 4);
    fill(0);
    textSize(15);
    if (num) {
      text(v, x+30, y+h-20);
    } else {
      if (o=='n') {
        text("+/-", x+20, y+h-20);
      } else if (o=='/') {
        text("÷", x+30, y+h-20);
      } else if (o=='*') {
        text("x", x+30, y+h-20);
      } else if (o=='-') {
        text("-", x+30, y+h-20);
      } else if (o=='+') {
        text("+", x+30, y+h-20);
      } else if (o=='c') {
        text("c", x+75, y+h-20);
      } else if (o=='=') {
        text("=", x+75, y+h-20);
      } else if (o=='.') {
        text(".", x+30, y+h-20);
      } else if (o=='%') {
        text("%", x+30, y+h-20);
      } else if (o=='π') {
        text("π", x+30, y+h-20);
      } else if (o=='2') {
        text("^2", x+27, y+h-20);
      } else if (o=='√') {
        text("√", x+30, y+h-20);
      }
    }
  }

  void hover() {
    hov=mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h;
  }
}