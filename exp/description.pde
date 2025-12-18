int page;

void description(){
  text("<Esc> 実験を中止", 100, 30);
  text("本実験の回答方法", width/2, height/8);
  textAlign(LEFT);
  switch(page){
    case 1: dPage1(); break;
    case 2: dPage2(); break;
    default: break;
  }
  textAlign(CENTER);
  if(page < 2) text("→", width/2 + 150, height/8);
  if(page > 1) text("←", width/2 - 150, height/8);
  if(state == 3) text("<Q> 戻る / <Enter> 実験を開始する", width/2, height*15/16);
  if(state == 5) text("<Q> 戻る", width/2, height*15/16);
  text(page + "/2", width - 50, height - 50);
}

void descriptionKP(){
  if(keyCode == ESC) exit();
  if(keyCode == ENTER && state == 3){
    initDataset();
    state = 4;
  }
  if(keyCode == RIGHT && page < 2) page++;
  if(keyCode == LEFT && page > 1) page--;
  if(key == 'q'){
    if(state == 3) state = 2;
    if(state == 5) state = 4;
  }
}

void dPage1(){
  text("1. 最初に刺激が1つ表示されます．その刺激を「あなたの部屋」だと思ってください．", width/8, height*14/64);
  text("2. その刺激に対して複数の質問に，1（全く当てはまらない）~7（最も当てはまる）の\n尺度で回答してください．", width/8, height*18/64);
  text("3. その後3段階の刺激セットが表示されます．1段階目の刺激は最初の刺激と同じものです\n．これらも「あなたの部屋」だと思ってください．", width/8, height*24/64);
  text("4. 2~3段階目の刺激に対して複数の質問に，1（全く当てはまらない）~7（最も当ては\nまる）の尺度で回答してください．", width/8, height*30/64);
  text("5. また，セット全体に対する，理由を記述する形式の質問に回答してください．回答はこ\nのアプリケーションではなく，パッケージに同梱されているフォームに記述してください．", width/8, height*36/64);
  text("6. 以上のタスクを5セットの刺激セットについて全て回答してください．", width/8, height*42/64);
}

void dPage2(){
  text("7. 1~7の尺度は数字キーを押せば入力できます．", width/8, height*14/64);
  text("8. 回答は順不同で構いませんが，最初はベースの部屋を回答してください．", width/8, height*18/64);
  text("9. 尺度の回答の際に，一貫したスケールで回答することを心がけてください．", width/8, height*22/64);
  text("10. 回答漏れがないように，実験を終了する前によく確認してください．", width/8, height*26/64);
  text("11. 記述式の回答は解答欄を間違えないようにご注意ください\n（「セット⚪︎」ではなく「Set Index: ⚪︎」です！）．", width/8, height*30/64);
  text("12. 回答の制限時間はありません．", width/8, height*36/64);
  text("13. 回答の途中で休憩を挟んでも構いません．ただし，休憩中は他のタスクを行わないよう\nにお願いいたします．", width/8, height*40/64);
  text("14. 回答の途中で回答を中止しても構いませんが，進行中の記録は消去されます．", width/8, height*46/64);
}