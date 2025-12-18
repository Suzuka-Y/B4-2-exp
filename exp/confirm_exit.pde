void confirm_exit(){
  text("実験を中止しますか?", width/2, height/3);
  text("中止した場合，実験の内容は失われます．", width/2, height/3 + 50);
  text("<Enter> はい", width*2/6, height*2/3);
  text("<P> いいえ", width*4/6, height*2/3);
}

void confirm_exitKP(){
  if(keyCode == ENTER) exit();
  if(key == 'p') state = 4;
}
