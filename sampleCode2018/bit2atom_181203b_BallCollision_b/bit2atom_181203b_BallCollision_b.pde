samplePoint[] mySample;
int spTotalNum = 200;

void setup() {
  size(400, 400);
  mySample = new samplePoint[spTotalNum];
  initiate();
}

void initiate(){
  for (int i = 0; i < spTotalNum; i ++) {
    PVector elli = new PVector(random(50, width-50), random(50,height-50));
    float elliR = random(5, 15);
    mySample[i] = new samplePoint(elli, elliR, i+1);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < spTotalNum; i ++) {
    mySample[i].update();
  }
}

void mousePressed(){
  initiate();
}
