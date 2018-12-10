void generateSampleData() {
  sp = new samplePoint[SampleTotalNum];
  for (int i = 0; i < sp.length; i ++) {
    sp[i] = new samplePoint(new PVector(random(50, width-50), random(50, height-50)), i, 0, 0);
  }
}
