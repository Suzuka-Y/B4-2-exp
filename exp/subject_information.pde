String target_SI;
String target_SI_date;
boolean approvable_SI;

void subject_infomation(){
  text("<Esc> 実験を中止", 100, 30);
  text("被験者情報の入力", width/2, height/8);
  text("入力された内容は，個人が特定できない形で保存されます．", width/2, height*2/8);
  text("生年月日：", width/3, height*3/8);
  text(year + " 年 " + month + " 月 " + day + " 日", width*2/3, height*3/8);
  text("生物学的性別：", width/3, height*4/8);
  text("<Q> 戻る", width/3, height*6/8);
  if(approvable_SI) text("<Enter> 次へ", width*2/3, height*6/8);
  text("※生年月日を正しく入力しないと，次に進めません．", width/2, height*7/8);
  fill(255, 255, 0);
  float posX = 0;
  if(target_SI == "date"){
    if(target_SI_date == "year") posX = width*79/128;
    if(target_SI_date == "month") posX = width*86/128;
    if(target_SI_date == "day") posX = width*91/128;
    text("↑", posX, height*11/32);
    text("↓", posX, height*13/32);
    text("<S> ↓", width/3, height*13/32);
  }
  if(target_SI == "sex") text("<W> ↑", width/3, height*15/32);
  if(sex == "male"){
    if(target_SI != "sex") fill(255, 0, 255);
  } else fill(255);
  text("男性", width*2/3 - 70, height*4/8);
  fill(255, 255, 0);
  if(sex == "female"){
    if(target_SI != "sex") fill(255, 0, 255);
  } else fill(255);
  text("女性", width*2/3, height*4/8);
  fill(255, 255, 0);
  if(sex == "others"){
    if(target_SI != "sex") fill(255, 0, 255);
  } else fill(255);
  text("その他", width*2/3 + 70, height*4/8);
}

boolean verifyDate(){
  try{
    age = calculateAge(year, month, day);
    if(age >= 18) return true;
    else return false;
  } catch(Exception e){
    return false;
  }
}

int calculateAge(int year, int month, int day) {
  LocalDate birthDate = LocalDate.of(year, month, day);
  LocalDate currentDate = LocalDate.now();
  return Period.between(birthDate, currentDate).getYears();
}

void subject_infomationKP(){
  if(keyCode == ESC) exit();
  if(key == 'q') state = 1;
  if(keyCode == ENTER && approvable_SI) state = 3;
  if(key == 'w') target_SI = "date";
  if(key == 's') target_SI = "sex";
  if(keyCode == RIGHT){
    if(target_SI == "date"){
      if(target_SI_date == "year") target_SI_date = "month";
      else if(target_SI_date == "month") target_SI_date = "day";
    }
    if(target_SI == "sex"){
      if(sex == "male") sex = "female";
      else if(sex == "female") sex = "others";
    }
  }
  if(keyCode == LEFT){
    if(target_SI == "date"){
      if(target_SI_date == "day") target_SI_date = "month";
      else if(target_SI_date == "month") target_SI_date = "year";
    }
    if(target_SI == "sex"){
      if(sex == "others") sex = "female";
      else if(sex == "female") sex = "male";
    }
  }
  if(keyCode == UP && target_SI == "date"){
    if(target_SI_date == "year") year++;
    if(target_SI_date == "month"){
      if(month >= 12) month = 1;
      else month++;
    }
    if(target_SI_date == "day"){
      if(day >= 31) day = 1;
      else day++;
    }
  }
  if(keyCode == DOWN && target_SI == "date"){
    if(target_SI_date == "year") year--;
    if(target_SI_date == "month"){
      if(month <= 1) month = 12;
      else month--;
    }
    if(target_SI_date == "day"){
      if(day <= 1) day = 31;
      else day--;
    }
  }
  approvable_SI = verifyDate();
}
