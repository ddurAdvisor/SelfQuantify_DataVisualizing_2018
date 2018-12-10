/*
* K-Means clustering
 * by Lyman ZHANG
 * 12-09-2018
 */

samplePoint[] sp;
samplePoint[] spk; //CENTER POINTS OF CLUSTERS

int k = 5;
int SampleTotalNum = 50;
int clusterIndex = 0;
float precision = 0;

boolean clustering = false;

void setup() {
  frameRate(1);
  size(800, 800);
  initiateData(); //generate data
}

void initiateData() {
  generateSampleData();
  randomkpoint();
}

void draw() {
  background(255);
  if (clustering) {
    clustergroup(spk);
    updateClusterGroup();

    drawConnections();
  }
  
  displayData();
  println("precision02: "+precision);
}

void displayData() {
  for (int i = 0; i < sp.length; i ++) {
    sp[i].run();
  }

  for (int i = 0; i < spk.length; i ++) {
    spk[i].run();
  }
}

void keyPressed() {
  if (key == 'a') {
    initiateData();
    background(0);
    clusterIndex = 0;
  }

  if (key == 'c') {
    clustering = true;
  }
}
