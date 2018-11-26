Table table;
float[] elli = new float[4];

void setup(){
  size(800, 600);
  table = loadTable("data.csv", "header");
  getData();
}

void getData(){
  //for(int i = 0; i < table.getRowCount(); i ++){
  //  TableRow row = table.getRow(i);
  //  float xx = row.getFloat(0);
  //  float yy = row.getFloat(1);
  //  float ww = row.getFloat(2);
  //  float hh = row.getFloat(3);
  //}
  
  println(table.getRowCount());
  TableRow row3 = table.getRow(2);
  for(int i = 0; i < elli.length; i ++){
    elli[i] = row3.getFloat(i);
  }
}

void draw(){
  background(255);
  ellipse(elli[0], elli[1], elli[2], elli[3]);
}
