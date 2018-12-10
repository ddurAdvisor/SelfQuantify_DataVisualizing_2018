class samplePoint {
  PVector spLoc;
  int index; //index of sample / data sample
  int clusterGroup; //level of cluster
  int clusterclass;

  samplePoint(PVector spLoc_, int index_, int clusterGroup_, int clusterclass_) {
    spLoc = spLoc_;
    index = index_;
    clusterGroup = clusterGroup_;
    clusterclass = clusterclass_;
  }

  void run() {
    display();
  }

  void display() {
    stroke(255/(clusterGroup+1)*clusterGroup);
    if (clusterclass == 1) {
      strokeWeight(20);
    } else {
      strokeWeight(5);
    }
    point(spLoc.x, spLoc.y);
    fill(0);
    text(index + ":" + clusterGroup, spLoc.x + 5, spLoc.y + 5);
  }
}
