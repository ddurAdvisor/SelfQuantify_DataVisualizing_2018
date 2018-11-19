int xx = 100;
int yy = 100;
float rr = 75;
float dd = 40;
float ang = 0;
  
float xoff = 0.0;

void setup() {
  frameRate(30);
  size(400, 300);
  background(255);
}

void draw() {
  //fill(255, 100, 100, 20);
  //rect(0, 0, width, height);
  fill(random(255), random(255), random(255));
  stroke(50);
  strokeWeight(0.5);
  //noStroke();
  ang = ang + TWO_PI/200;

  xx = width/2 + int(rr * sin(ang));
  yy = height/2 + int(rr * cos(ang));
  
  xoff = xoff + .02;
  dd = 20 + 40*noise(xoff);
  
  //dd = 40 + 20*cos(ang*2);

  ellipse(xx, yy, dd, dd);

  //xx = xx + 5;
  //if(xx > width){
  //  xx = 0;
  //  yy = yy + 5;
  //}
}
