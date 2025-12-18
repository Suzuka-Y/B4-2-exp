float posY_IC;

void informed_consent(){
  text("<Esc> 実験を中止", 100, 30);
  text("本実験の受験に関するお願い", width/2, height/8);
  textAlign(LEFT);
  text("1. 本実験の目的は，建築環境の特定の特徴が人間の負の感情にどう影響を与えるかに\nついて調査することです．", width/8, height*8/32);
  text("2. 実験中に負の感情（具体的には，不気味だという感情）を喚起するような刺激が呈\n示され，精神的な不快感や動揺が引き起こされる可能性があります．", width/8, height*11/32);
  text("3. 本実験は18歳以上の方が参加できます．18歳未満の方は参加できません．", width/8, height*14/32);
  text("4. 実験参加者は実験の途中に休憩を挟んでも構いません．", width/8, height*16/32);
  text("5. 実験参加者は実験の途中に実験を中止しても構いません．", width/8, height*18/32);
  text("6. 実験参加者は，要望があれば実験結果について閲覧することができます．", width/8, height*20/32);
  text("7. 実験結果は個人情報が特定されない形で保管され，本研究の目的以外の用途で使用\nされることはありません．", width/8, height*22/32);
  text("8. 以上の内容をよく読み，理解し，本実験の受験に同意していただける場合は「Yes」\nと回答し，実験を開始してください．", width/8, height*25/32);
  if(posY_IC >= height*26/32){
    textAlign(CENTER);
    text("<Q> No / <Enter> Yes", width/2, height*15/16);
  }
  fill(255, 255, 0);
  textAlign(CENTER);
  text(">", width/8 - 30, posY_IC);
}

void informed_consentKP(){
  if(keyCode == ESC) exit();
  if(keyCode == DOWN && posY_IC <= height*26/32) posY_IC += 5;
  if(keyCode == UP && posY_IC >= height*8/32) posY_IC -= 5;
  if(keyCode == ENTER && posY_IC >= height*26/32) state = 2;
  if(key == 'q' && posY_IC >= height*26/32) exit();
}
