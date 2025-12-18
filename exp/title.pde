void title(){
  text("<Esc> 実験を中止", 100, 30);
  text("卒業研究2 実験", width/2, height/3);
  text("<Enter> 次へ", width/2, height*3/4);
}

void titleKP(){
  if(keyCode == ESC) exit();
  if(keyCode == ENTER){
    state = 1;
  }
}
