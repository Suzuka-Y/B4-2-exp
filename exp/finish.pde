void finish(){
  text("本実験を終了しました．", width/2, height/3);
  text("ご自由にご退出ください．ご協力ありがとうございました．", width/2, height/2);
  text("<Q> 退出する", width/2, height*2/3);
}

void finishKP(){
  if(key == 'q') exit();
}
