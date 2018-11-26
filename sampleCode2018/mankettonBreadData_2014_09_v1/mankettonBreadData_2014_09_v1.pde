Table mktTable;
PFont font;

int interval = 100;
int barWidth = 20;
int barLeftLowerW = 50;
int barLeftLowerH = 650;
int pushMatrixInit = 0;

void setup() {
  size(1600, 720);
  font = createFont("微软雅黑", 10);
  mktTable = loadTable("data_demo_SJTU.csv", "header");
  smooth();
}

void draw() {
  background(50);
  textFont(font, 10);

  pushMatrix();
  translate(pushMatrixInit, 0);
  for (int i = 0; i < mktTable.getRowCount (); i ++) {
    TableRow row = mktTable.getRow(i);

    String p = row.getString("客户名称");
    String n = row.getString("产品名称");
    float x = row.getInt("销量");
    float y = row.getInt("送量");
    float z = row.getInt("退量");
    float t = row.getInt("金额");
    drawBars(i, p, n, x, y, z, t);
    displayInfo(i, p, n, t);
  }
  popMatrix();
  println(pushMatrixInit);
  displayTitle();
}

void displayTitle() {
  textFont(font, 24);
  fill(#8FDE57);
  text("曼可顿面包2014年9月份上海销售数据\n++上海交通大学++", 50, 80);
  textFont(font, 20);  
  fill(255);
  text("LEFT Arrow: move table leftward",550, 80);
  text("RIGHT Arrow: move table rightward",550, 100);
  text("Press i: add interval value",550, 120);
  text("Press k: minus interval value",550, 140);
  text("Press w: add barWidth value",550, 160);
  text("Press s: minus barWidth value",550, 180);
}

void drawBars(int index, String client, String ProductName, float barX, float barY, float barZ, float barT) {
  noStroke();
  fill(100, 255, 0);
  rect(barLeftLowerW+barWidth*3*index+interval*index, barLeftLowerH-barT, barWidth*3, barT);
  fill(100);
  rect(barLeftLowerW+barWidth*3*index+interval*index, barLeftLowerH-barX, barWidth, barX);
  fill(150);
  rect(barLeftLowerW+barWidth*3*index+interval*index+barWidth, barLeftLowerH-barY, barWidth, barY);
  fill(200);
  rect(barLeftLowerW+barWidth*3*index+interval*index+barWidth*2, barLeftLowerH-barZ, barWidth, barZ);
  fill(255);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      pushMatrixInit -= 10;
    }
    if (keyCode == RIGHT) {
      pushMatrixInit += 10;
    }
  }
  if (interval >= 2) {
    if (key == 'k') {
      interval --;
    }
    if (key == 'i') {
      interval ++;
    }
  }
  if (barWidth >= 2) {
    if (key == 's') {
      barWidth --;
    }
    if (key == 'w') {
      barWidth ++;
    }
  }
}

void displayInfo(int index, String client, String ProductName, float barT) {
  if (mouseX > pushMatrixInit+barLeftLowerW+barWidth*3*index+interval*index && mouseX < pushMatrixInit+barLeftLowerW+barWidth*3*index+interval*index + barWidth*3) {
    if (mouseY > barLeftLowerH-barT && mouseY < barLeftLowerH) {
      fill(#4D6E74);
      rect(barLeftLowerW+barWidth*3*index+interval*index, barLeftLowerH+10, textWidth(ProductName)+10, 30, 5);
      fill(255);
      text(" "+client, barLeftLowerW+barWidth*3*index+interval*index+5, barLeftLowerH+10+10);
      fill(100, 255, 0);
      text(" "+ProductName, barLeftLowerW+barWidth*3*index+interval*index+5, barLeftLowerH+10+25);
    }
  }
}