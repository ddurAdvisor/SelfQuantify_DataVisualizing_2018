PFont font;

float[] pY = new float[8];
int step = 80;
int leftMargin = 50;

void setup(){
  size(800, 600);
  background(175);
  font = createFont("微软雅黑", 16);
  initiateData();
}

void initiateData(){
  dataGeneration();
}

void draw(){
  background(175);
  drawDiagram();
  text("当前一共有"+pY.length+"个数据点", width-leftMargin*3, leftMargin);
  
  for (int i = 0; i < pY.length; i++) {
    float pXX = leftMargin + step * i;
    float pyy = pY[i];
    float pmDist = dist(pXX, pyy, mouseX, mouseY);
    if(pmDist < 20){
      text(pyy, pXX+10, pyy-10);
    }
  }
}

void dataGeneration() {
  for (int i = 0; i < pY.length; i++) {
    pY[i] = random(50, height-50);
  }
}

void mousePressed(){
  initiateData();
}

void drawDiagram(){
  guideLines();
  //drawLines();
  drawCurve();
  drawPoints();
}

void guideLines(){
  float gXs = leftMargin;
  float gXe = width-leftMargin;
  strokeWeight(1);
  stroke(175+50);
  line(gXs, height/2, gXe, height/2);
  
  float yy = leftMargin;
  float yy2 = height - leftMargin;
  line(leftMargin, yy, leftMargin, yy2);
  
  for (int i = 0; i < pY.length; i++) {
    line(leftMargin + step * i, height/2-20, leftMargin + step * i, height/2);
  }
}

void drawLines() {
  strokeWeight(1);
  for (int i = 0; i < pY.length-1; i++) {
    float xx = leftMargin + step * i;
    float xx2 = leftMargin + step * (i+1);
    stroke(0);
    line(xx, pY[i], xx2, pY[i+1]);
  }
}

void drawCurve() {
  strokeWeight(1);
  stroke(0);
  noFill();
  beginShape();
  curveVertex(leftMargin, pY[0]);
  for (int i = 0; i < pY.length; i++) {
    float xxx = leftMargin + step * i;
    curveVertex(xxx, pY[i]);
  }
  curveVertex(leftMargin + step * (pY.length - 1), pY[pY.length-1]);
  endShape();
}

void drawPoints() {
  for (int i = 0; i < pY.length; i++) {
    float xx = leftMargin + step * i;
    strokeWeight(5);
    stroke(0);
    point(xx, pY[i]);
  }
}
