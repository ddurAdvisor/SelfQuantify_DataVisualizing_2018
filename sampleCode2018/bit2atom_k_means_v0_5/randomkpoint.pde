void randomkpoint() {
  spk = new samplePoint[k];
  for (int i = 0; i < spk.length; i ++) {
    spk[i] = new samplePoint(new PVector(random(50, width-50), random(50, height-50)), i, 0, 1);
  }
}
