void mousePressed() {
  Point p = new Point(mouseX, mouseY);
  Points[len]=p;
  
  fill(#B98FDE);
  ellipse(mouseX, mouseY, 5, 5);
  len++;
}
