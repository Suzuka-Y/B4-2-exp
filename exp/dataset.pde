class set{
  int[][] eval = new int[2][7];
  set(String type){
    for(int j = 0; j < 2; j++){
      for(int k = 0; k < 7; k++) {
        if(type.equals("normal") && k == 6) eval[j][k] = -1;
        else eval[j][k] = 1;
      }
    }
  }
}

class baseset{
  int[] eval = new int[7];
  baseset(){
    for(int i = 0; i < 7; i++){
      if(i == 6) eval[i] = -1;
      else eval[i] = 1;
    }
  }
}

int year, month, day;
int age;
String sex;

set[] sets;//0: 位置，1: サイズ，2: 欠落，3: 過剰反復，4: 社会的存在
baseset bSet;

int startTime;
int[] setOrder = new int[5];
int[] evalOrder = new int[7];
int[] evalOrder2 = new int[6];
String[] q = new String[7];
PImage bimg;
PImage[][] img = new PImage[5][2];

void initDataset(){
  shuffleOrder(setOrder);
  shuffleOrder(evalOrder);
  evalOrder2 = setEO2();
  q[0] = "この部屋を見たときに感じる違和感の強さはどの程度ですか?";
  q[1] = "この部屋の雰囲気は、どれくらい居心地の悪さを感じさせますか?";
  q[2] = "この部屋の家具やパーツの配置は、どれくらい不自然に感じますか?";
  q[3] = "この部屋の家具やパーツのサイズは、どれくらい不自然に感じますか?";
  q[4] = "この部屋は、普通は存在する物がどれくらい欠けているように感じますか?";
  q[5] = "この部屋は、物がどれくらい過剰に存在しているように感じますか?";
  q[6] = "この部屋に人物が存在していることは、どれくらい不自然に感じますか?";
  bimg = loadImage("BR1.png");
  for(int i = 0; i < 2; i++) img[0][i] = loadImage("P" + (i + 1) + ".png");
  for(int i = 0; i < 2; i++) img[1][i] = loadImage("S" + (i + 1) + ".png");
  for(int i = 0; i < 2; i++) img[2][i] = loadImage("L" + (i + 1) + ".png");
  for(int i = 0; i < 2; i++) img[3][i] = loadImage("R" + (i + 1) + ".png");
  for(int i = 0; i < 2; i++) img[4][i] = loadImage("H" + (i + 1) + ".png");
  sets = new set[5];
  for(int i = 0; i < 5; i++){
    if(i == 4) sets[i] = new set("hSet");
    else sets[i] = new set("normal");
  }
  bSet = new baseset();
  startTime = millis();
}

void shuffleOrder(int[] order){
  for(int i = 0; i < order.length; i++) order[i] = -1;
  for(int i = 0; i < order.length; i++){
    while(true){
      int num = int(random(order.length));
      boolean ans = true;
      for(int j = 0; j < i; j++){
        if(num == order[j]) ans = false;
      }
      if(ans){
        order[i] = num;
        break;
      }
    }
  }
}

int[] setEO2(){
  int[] ans = new int[0];
  for(int i = 0; i < 7; i++){
    if(evalOrder[i] != 6) ans = append(ans, evalOrder[i]);
  }
  return ans;
}

void setDebugDataSets(){
  year = 2000;
  month = 1;
  day = 1;
  age = calculateAge(year, month, day);
  sex = "";
  initDataset();
}