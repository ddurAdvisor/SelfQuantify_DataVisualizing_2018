samplePoint[] mySample;
int spTotalNum = 20;

void setup() {
  size(400, 400);
  mySample = new samplePoint[spTotalNum];

  for (int i = 0; i < spTotalNum; i ++) {
    PVector elli = new PVector(random(50, width-50), random(50,height-50));
    float elliR = random(5, 15);
    mySample[i] = new samplePoint(elli, elliR);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < spTotalNum; i ++) {
    //mySample[i].move();
    //mySample[i].edge();
    //mySample[i].collision();
    //mySample[i].display();
    mySample[i].update();
  }
  println(mySample.length);
}
