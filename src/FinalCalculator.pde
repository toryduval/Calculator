Button[] numButton= new Button[10];
Button[] opButton= new Button[12];
String ls, rs; //left side  operator  right side = answer
float ans;  //answer
char op; //operator
boolean left, eq; //Left of operator, after equal is hit

void setup() {
  size(365, 510);
  background(220);
  ls="0";
  rs="0";
  ans=0.0;
  op=' ';
  left=true;
  eq=false;
  numButton[0]=new Button(20, 375, 70, 50).asNumber(0);
  numButton[1]=new Button(20, 310, 70, 50).asNumber(1);
  numButton[2]=new Button(105, 310, 70, 50).asNumber(2);
  numButton[3]=new Button(190, 310, 70, 50).asNumber(3);
  numButton[4]=new Button(20, 245, 70, 50).asNumber(4);
  numButton[5]=new Button(105, 245, 70, 50).asNumber(5);
  numButton[6]=new Button(190, 245, 70, 50).asNumber(6);
  numButton[7]=new Button(20, 180, 70, 50).asNumber(7);
  numButton[8]=new Button(105, 180, 70, 50).asNumber(8);
  numButton[9]=new Button(190, 180, 70, 50).asNumber(9);

  opButton[0]=new Button(20, 115, 155, 50).asOperator('c');
  opButton[1]=new Button(190, 115, 70, 50).asOperator('n');
  opButton[2]=new Button(275, 115, 70, 50).asOperator('-');
  opButton[3]=new Button(275, 180, 70, 50).asOperator('*');
  opButton[4]=new Button(275, 245, 70, 50).asOperator('/');
  opButton[5]=new Button(275, 310, 70, 50).asOperator('+');
  opButton[6]=new Button(190, 375, 155, 50).asOperator('=');
  opButton[7]=new Button(105, 375, 70, 50).asOperator('.');
  opButton[8]=new Button(20, 440, 70, 50).asOperator('%');
  opButton[9]=new Button(105, 440, 70, 50).asOperator('π');
  opButton[10]=new Button(190, 440, 70, 50).asOperator('2');
  opButton[11]=new Button(275, 440, 70, 50).asOperator('√');
}

void draw() {
  stroke(0);
  for (int i=0; i<numButton.length; i++) {
    numButton[i].display();
    numButton[i].hover();
  }
  for (int i=0; i<opButton.length; i++) {
    opButton[i].display();
    opButton[i].hover();
  }

  updateDisplay();
}

void keyPressed() {
  if (key=='+') {
    left=false;
    op=opButton[5].o;
    rs="";
  } else if (key=='-') {
    left=false;
    op=opButton[2].o;
    rs="";
  } else if (key=='*'||key=='x') {
    left=false;
    op=opButton[3].o;
    rs="";
  } else if (key=='/'||key=='÷') {
    left=false;
    op=opButton[4].o;
    rs="";
  } else if (key=='c') {
    performClear();
  } else if (key=='=' || key==ENTER || key==RETURN) {
    eq=true;
    performCalc();
  } else if (key=='.') {
    if (left) {
      ls += opButton[7].o;
    } else {
      rs+=opButton[7].o;
    }
  } else if (key=='%') {
    if (left) {
      ans = float(ls)*.01;
      ls=str((float)ans);
    } else {
      ans=float(rs)*.01;
      rs=str((float)ans);
    }
  }

  if (key=='0') {
    if (left) {
      ls+=numButton[0].v;
    } else {
      rs+=numButton[0].v;
    }
  } else if (key=='1') {
    if (left) {
      ls+=numButton[1].v;
    } else {
      rs+=numButton[1].v;
    }
  } else if (key=='2') {
    if (left) {
      ls+=numButton[2].v;
    } else {
      rs+=numButton[2].v;
    }
  } else if (key=='3') {
    if (left) {
      ls+=numButton[3].v;
    } else {
      rs+=numButton[3].v;
    }
  } else if (key=='4') {
    if (left) {
      ls+=numButton[4].v;
    } else {
      rs+=numButton[4].v;
    }
  } else if (key=='5') {
    if (left) {
      ls+=numButton[5].v;
    } else {
      rs+=numButton[5].v;
    }
  } else if (key=='6') {
    if (left) {
      ls+=numButton[6].v;
    } else {
      rs+=numButton[6].v;
    }
  } else if (key=='7') {
    if (left) {
      ls+=numButton[7].v;
    } else {
      rs+=numButton[7].v;
    }
  } else if (key=='8') {
    if (left) {
      ls+=numButton[8].v;
    } else {
      rs+=numButton[8].v;
    }
  } else if (key=='9') {
    if (left) {
      ls+=numButton[9].v;
    } else {
      rs+=numButton[9].v;
    }
  }
}


void mouseReleased() {
  for (int i=0; i<numButton.length; i++) {
    if (numButton[i].hov && left) {
      ls += numButton[i].v;
    } else if (numButton[i].hov && !left) {
      rs += numButton[i].v;
    }
  }

  for (int i=0; i<opButton.length; i++) {
    if (opButton[i].hov && opButton[i].o == 'c') {
      performClear();
    } else if (opButton[i].hov && opButton[i].o == '+') {
      left=false;
      op=opButton[i].o;
      rs="";
    } else if (opButton[i].hov && opButton[i].o == '-') {
      left=false;
      op=opButton[i].o;
      rs="";
    } else if (opButton[i].hov && opButton[i].o == '*') {
      left=false;
      op=opButton[i].o;
      rs="";
    } else if (opButton[i].hov && opButton[i].o == '/') {
      left=false;
      op=opButton[i].o;
      rs="";
    } else if (opButton[i].hov && opButton[i].o == '=') {
      eq=true;
      performCalc();
    } else if (opButton[i].hov && opButton[i].o == 'n') {
      if (left) {
        ans = float(ls) * -1;
        ls = str((float)ans);
      } else {
        ans = float(rs)*-1;
        rs = str((float)ans);
      }
    } else if (opButton[i].hov && opButton[i].o == '.') {
      if (left) {
        ls += opButton[i].o;
      } else {
        rs += opButton[i].o;
      }
    } else if (opButton[i].hov && opButton[i].o == '%') {
      if (left) {
        ans = float(ls)*0.01;
        ls = str((float)ans);
      } else {
        ans = float(rs)*0.01;
        rs = str((float)ans);
      }
    } else if (opButton[i].hov && opButton[i].o == 'π') {
      op=opButton[i].o;
    } else if (opButton[i].hov && opButton[i].o == '2') {
      if (left) {
        ans = sq(float(ls));
        ls = str((float)ans);
      } else {
        ans = sq(float(rs));
        rs = str((float)ans);
      }
    } else if (opButton[i].hov && opButton[i].o == '√') {
      if (left) {
        ans = sqrt(float(ls));
        ls = str((float)ans);
      } else {
        ans = sqrt(float(rs));
        rs = str((float)ans);
      }
    }
  }
}
//operations
void performCalc() {
  switch(op) {
  case '+':
    ans=float(ls)+float(rs);
    ls=str((float)ans);
    left=true;
    break;
  case '-':
    ans=float(ls)-float(rs);
    ls=str((float)ans);
    left=true;
    break;
  case '*':
    ans=float(ls)*float(rs);
    ls=str((float)ans);
    left=true;
    break; 
  case '/':
    ans=float(ls)/float(rs);
    ls=str((float)ans);
    left=true;
    break;
  case 'π':
    ans=float(ls)*3.141592653589793;
    ls=str((float)ans);
    left=true;
    ans=float(rs)*3.141592653589793;
    rs=str((float)ans);
    break;
  }
}
//=
void performClear() {
  ls="0";
  rs="0";
  ans=0.0;
  op=' ';
  left=true;
  eq=false;
}

void updateDisplay() {
  //display box
  fill(0);
  stroke(0);
  rect(15, 15, 330, 80, 10);
  //answer
  fill(255);
  textSize(30);
  if (eq) {
    text((float)ans, 30, 70);
  } else {
    if (left) {
      text(ls, 30, 70);
    } else {
      text(rs, 30, 70);
    }
  }
  eq=false;
}