void confirm_submit(){
  text("実験内容を提出し，終了しますか?", width/2, height/3);
  text("提出した場合，実験の内容は変更できません．", width/2, height/3 + 50);
  text("<Enter> はい", width*2/6, height*2/3);
  text("<Q> いいえ", width*4/6, height*2/3);
}

void confirm_submitKP(){
  if(keyCode == ENTER){
    float expTime = (millis() - startTime)/1000;
    result.addColumn("PID");
    result.addColumn("age");
    result.addColumn("sex");
    result.addColumn("expTime");
    result.addColumn("SetOrder");
    result.addColumn("questions");
    result.addColumn("base");
    for(int n = 2; n <= 3; n++) result.addColumn("position" + n);
    for(int n = 2; n <= 3; n++) result.addColumn("size" + n);
    for(int n = 2; n <= 3; n++) result.addColumn("lack" + n);
    for(int n = 2; n <= 3; n++) result.addColumn("repetition" + n);
    for(int n = 2; n <= 3; n++) result.addColumn("human" + n);
    for(int i = 0; i < 7; i++){
      TableRow newRow = result.addRow();
      if(i == 0){
        newRow.setInt("PID", PID);
        newRow.setInt("age", age);
        newRow.setString("sex", sex);
        newRow.setFloat("expTime", expTime);
      }
      if(i < 5) newRow.setInt("SetOrder", setOrder[i]);
      newRow.setString("questions", "q" + (i + 1));
      newRow.setInt("base", bSet.eval[i]);
      for(int n = 0; n < 2; n++) newRow.setInt("position" + (n + 2), sets[0].eval[n][i]);
      for(int n = 0; n < 2; n++) newRow.setInt("size" + (n + 2), sets[1].eval[n][i]);
      for(int n = 0; n < 2; n++) newRow.setInt("lack" + (n + 2), sets[2].eval[n][i]);
      for(int n = 0; n < 2; n++) newRow.setInt("repetition" + (n + 2), sets[3].eval[n][i]);
      for(int n = 0; n < 2; n++) newRow.setInt("human" + (n + 2), sets[4].eval[n][i]);
    }
    String timestamp_end = year() + "-" + month() + "-" + day() + "_" + hour() + "-" + minute();
    String filename = "results/"+ PID + "_" + timestamp_end + ".csv";
    saveTable(result, filename, "csv");
    state = 8;
  }
  if(key == 'q') state = 4;
}
