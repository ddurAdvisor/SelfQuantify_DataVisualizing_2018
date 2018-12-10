void clustergroup(samplePoint[] cpk) {
  for (int i = 0; i < sp.length; i ++) {

    PVector[] sp2kg = new PVector[cpk.length];
    float minDist = width * height;
    int minIndex = 0;

    for (int j = 0; j < cpk.length; j ++) {
      sp2kg[j] = PVector.sub(sp[i].spLoc, cpk[j].spLoc);
      if (sp2kg[j].mag()<minDist) {
        minDist = sp2kg[j].mag();
        minIndex = i;
        sp[i].clusterGroup = j;
      }
    }
  }
}

void updateClusterGroup() {
  precision = 0;
  for (int i = 0; i < spk.length; i ++) {
    PVector previuosCP = spk[i].spLoc;
    PVector centerPoint = new PVector(0, 0);
    int count = 0;
    for (int j = 0; j < sp.length; j ++) {
      if (sp[j].clusterGroup == i) {
        centerPoint.add(sp[j].spLoc);
        count ++;
        //centerPoint = PVector.add(centerPoint, sp[j].spLoc);
      }
    }
    centerPoint.div(count); //spk.length);
    spk[i] = new samplePoint(centerPoint, i, 0, 1);
    
    PVector dpp = PVector.sub(previuosCP, spk[i].spLoc);
    float dppdist = dpp.mag();
    precision += dppdist;
  }
}

void drawConnections(){
  for (int i = 0; i < spk.length; i ++) {
    for (int j = 0; j < sp.length; j ++) {
      if (sp[j].clusterGroup == i) {
        strokeWeight(1);
        stroke(100);
        line(spk[i].spLoc.x, spk[i].spLoc.y, sp[j].spLoc.x, sp[j].spLoc.y);
      }
    }
  }
}
