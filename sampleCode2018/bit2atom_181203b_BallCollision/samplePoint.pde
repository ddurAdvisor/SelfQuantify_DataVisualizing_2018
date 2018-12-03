class samplePoint{
  
  PVector spLoc;
  float spR;
  PVector speed = new PVector(1, 1.5);
  PVector acc = new PVector(0, 0);
  
  samplePoint(PVector spLoc_, float rr_){
    spLoc = spLoc_;
    spR = rr_;
  }
  
  void update(){
    move();
    edge();
    collision();
    display();
    acc = new PVector(0, 0);
  }
  
  void display(){
    noStroke();
    ellipse(spLoc.x, spLoc.y, spR*2, spR*2);
  }
  
  void move(){
    //speed.add(acc);
    speed.limit(10);
    spLoc.add(speed);
  }
  
  void edge(){
    if(spLoc.x + spR > width || spLoc.x - spR < 0){
      speed.x = speed.x * -1;
    }
    if(spLoc.y + spR > height || spLoc.y - spR < 0){
      speed.y = speed.y * -1;
    }
  }
  
  void collision(){
    for(samplePoint sp : mySample){
      if(sp != this){
        float spDist = dist(sp.spLoc.x, sp.spLoc.y, this.spLoc.x, this.spLoc.y);
        if(spDist < sp.spR + this.spR){
          //acc = this.spLoc.sub(sp.spLoc);
          acc = PVector.sub(this.spLoc, sp.spLoc);
          acc.normalize();
          acc.mult(1);
          acc.limit(5);
          speed.add(acc);
        }
        if(spDist < 70){
          stroke(200, 0, 200);
          float lineWeight = map(spDist, 0, 70, 10, 1);
          strokeWeight(lineWeight);
          line(this.spLoc.x, this.spLoc.y, sp.spLoc.x, sp.spLoc.y);
        }
      }
    }
  }
}
