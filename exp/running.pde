int setnum;//0: ベース，1~5: ランダムセット
int show;//拡大表示した刺激の段階
int serect;//選択中の刺激の段階
int qserect;//各セットの選択中の質問番号
String disp;//刺激表示方法

void running(){
  text("<Esc> 実験を中止", 100, 30);
  text("<H> 回答方法", width - 100, 30);
  text("<P> 実験を終了", width - 100, 880);
  if(setnum > 0){
    text("セット" + setnum, width/2, 30);
    text("Set Index: " + (setOrder[setnum - 1] + 1), 100, 880);
  }
  else text("ベーステスト", width/2, 30);
  if(disp == "row"){
    text("<E> 表示切り替え", width/2, 340);
    if(setnum > 0){
      for(int n = 1; n <= 3; n++) serectSet(n);
      image(bimg, 1920/5/2+10, 150, 1920/5, 1080/5);
      image(img[setOrder[setnum - 1]][1], width-1920/5/2-10, 150, 1920/5, 1080/5);
    }
    if(setnum == 0) image(bimg, width/2, 150, 1920/5, 1080/5);
    else image(img[setOrder[setnum - 1]][0], width/2, 150, 1920/5, 1080/5);
    if(setnum > 0) text(serect + "段階目の刺激に関して...", width*3/16 + 10, 340);
    for(int n = 1; n <= 7; n++){
      if(n < 7) qset(n);
      if(n == 7 && setnum > 0 && setOrder[setnum - 1] == 4) qset(7);
    } 
  }
  if(disp == "enlarge"){
    text("<E> 表示切り替え", width/2, 100);
    if(setnum == 0) image(bimg, width/2, height/2, 1200, 675);
    else{
      if(show == 1) image(bimg, width/2, height/2, 1200, 675);
      else image(img[setOrder[setnum - 1]][show - 2], width/2, height/2, 1200, 675);
    }
    if(setnum > 0) text(show, width/2, height*9/10+10);
    fill(255, 255, 0);
    if(setnum > 0 && show > 1) text("←", width/2 - 100, height*9/10+10);
    if(setnum > 0 && show < 5) text("→", width/2 + 100, height*9/10+10);
  }
  fill(255, 255, 0);
  if(setnum > 0) text("← 前の実験へ <Z>", width/2 - 100, 880);
  if(setnum < 5) text("<X> 次の実験へ →", width/2 + 100, 880);
}

void runningKP(){
  if(keyCode == ESC){
    key = 0;
    state = 6;
  }
  if(key == 'p') state = 7;
  if(key == 'h') state = 5;
  if(key == 'e'){
    if(disp == "row"){
      disp = "enlarge";
      show = serect;
    } else if(disp == "enlarge") disp = "row";
  }
  if(disp == "row"){
    if(keyCode == RIGHT && setnum > 0 && serect < 3){
      serect++;
      qserect = 1;
    }
    if(keyCode == LEFT && setnum > 0 && serect > 2){
      serect--;
      qserect = 1;
    }
  }
  if(disp == "enlarge"){
    if(keyCode == RIGHT && setnum > 0 && show < 3) show++;
    if(keyCode == LEFT && setnum > 0 && show > 1) show--;
  }
  if(key == 'x' && setnum < 5){
    setnum++;
    qserect = 1;
    qserectValidate();
  }
  if(key == 'z' && setnum > 0){
    setnum--;
    qserect = 1;
    qserectValidate();
  }
  if(keyCode == UP && qserect > 1) qserect--;
  if(keyCode == DOWN){
    if(setnum > 0 && setOrder[setnum - 1] == 4 && qserect < 7) qserect++;
    else if(qserect < 6) qserect++;
  }
  if(key == '1') inputSets(1);
  if(key == '2') inputSets(2);
  if(key == '3') inputSets(3);
  if(key == '4') inputSets(4);
  if(key == '5') inputSets(5);
  if(key == '6') inputSets(6);
  if(key == '7') inputSets(7);
}

void inputSets(int input){
  if(setnum == 0) bSet.eval[evalOrder2[qserect - 1]] = input;
  else{
    if(setOrder[setnum - 1] == 4) sets[setOrder[setnum - 1]].eval[serect - 2][evalOrder[qserect - 1]] = input;
    else sets[setOrder[setnum - 1]].eval[serect - 2][evalOrder2[qserect - 1]] = input;
  }
}

void qserectValidate(){
  if(setnum > 0 && setOrder[setnum - 1] == 4){}
  else if(qserect > 6) qserect = 6;
}

void qset(int n){//質問の実装
  float HEIGHT;
  switch(n){
    case 1: HEIGHT = 400; break;
    case 2: HEIGHT = 470; break;
    case 3: HEIGHT = 540; break;
    case 4: HEIGHT = 610; break;
    case 5: HEIGHT = 680; break;
    case 6: HEIGHT = 750; break;
    case 7: HEIGHT = 820; break;
    default: HEIGHT = 0; break;
  }
  if(qserect == n){
    fill(255, 255, 0);
    if(qserect > 1) text("↑", 50, HEIGHT - 15);
    if(setnum > 0 && setOrder[setnum - 1] == 4 && qserect < 7) text("↓", 50, HEIGHT + 15);
    else if(qserect < 6) text("↓", 50, HEIGHT + 15);
  }
    text("q." + n, width/16 + 40, HEIGHT); textAlign(LEFT);
    if(setnum > 0 && setOrder[setnum - 1] == 4){
      text(q[evalOrder[n - 1]], width*2/16, HEIGHT);
      textAlign(RIGHT); text(sets[4].eval[serect - 2][evalOrder[n - 1]], width*14/16 + 20, HEIGHT);
    }else{
      text(q[evalOrder2[n - 1]], width*2/16, HEIGHT); textAlign(RIGHT);
      if(setnum == 0) text(bSet.eval[evalOrder2[n - 1]], width*14/16 + 20, HEIGHT);
      else text(sets[setOrder[setnum - 1]].eval[serect - 2][evalOrder2[n - 1]], width*14/16 + 20, HEIGHT);
    }
    fill(255); textAlign(CENTER);
}

void serectSet(int n){
  float HEIGHT;
  switch(n){
    case 1: HEIGHT = 1920/5/2+10; break;
    case 2: HEIGHT = width/2; break;
    case 3: HEIGHT = width-1920/5/2-10; break;
    default: HEIGHT = 0; break;
  }
  if(serect == n){
    fill(255, 255, 0);
    if(serect > 2 && setnum > 0) text("←", HEIGHT - 50, 300);
    if(serect < 3 && setnum > 0) text("→", HEIGHT + 50, 300);
    rectMode(CENTER); rect(HEIGHT, 150, 1920/5+10, 1080/5+10);
  }
  text(n, HEIGHT, 300); fill(255);
}
