import java.time.LocalDate;
import java.time.Period;

PFont font;
Table result;

int PID = 1;
int state;
boolean debug = true;

void setup(){
  frameRate(60);
  size(1200, 900);
  font = createFont("NotoSansJP-Regular.ttf", 24);
  textFont(font);
  fill(255);
  textAlign(CENTER);
  imageMode(CENTER);
  if(debug) state = 4;
  else state = 0;
  posY_IC = height*8/32;
  target_SI = "date";
  target_SI_date = "year";
  approvable_SI = false;
  setnum = 0;
  serect = 2;
  qserect = 1;
  show = 1;
  year = 2010;
  month = 1;
  day = 1;
  sex = "male";
  page = 1;
  disp = "row";
  result = new Table();
  if(debug) setDebugDataSets();
}

void draw(){
  background(0);
  textAlign(CENTER);
  fill(255);
  noStroke();
  switch(state){
    case 0: title(); break;
    case 1: informed_consent(); break;
    case 2: subject_infomation(); break;
    case 3: description(); break;
    case 4: running(); break;
    case 5: description(); break;
    case 6: confirm_exit(); break;
    case 7: confirm_submit(); break;
    case 8: finish(); break;
    default: break;
  }
}
