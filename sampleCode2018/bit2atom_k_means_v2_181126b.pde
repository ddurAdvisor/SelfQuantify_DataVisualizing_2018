PFont font;
int num = 500;
float dx = 1, dy = 1;//
int k = 3;
int k_max = 5;
int len = 0;
int iteration = 10000;
boolean flag=true;

Point [] Points = new Point [num];
Type [] Types = new Type [k_max];

void nearK() {
  for (int i = 0; i < len; i++) {
    float min = width * height;
    int index = -1;
    for (int j = 0; j < k; j++) {
      float r = dist(Points[i].x, Points[i].y, Types[j].x_old, Types[j].y_old);
      if (r < min) {
        min = r;
        index = j;
      }
    }
    if (index == -1)
      print("what??");
    else {
      Points[i].k=index;
      Types[index].num++;
    }
  }
}

void renew() {
  for (int i = 0; i < len; i++) {
    int u=Points[i].k;
    println("now"+u);
    Types[u].x_new += Points[i].x;
    Types[u].y_new += Points[i].y;
  }
  for (int i = 0; i < k; i++) {
    println(i+"num"+Types[i].num);
    Types[i].x_new=Types[i].x_new/Types[i].num;
    Types[i].y_new=Types[i].y_new/Types[i].num;
    println("xnew"+Types[i].x_new, "ynew"+Types[i].y_new);
    Types[i].num=1;
    if (abs(Types[i].x_new-Types[i].x_old)>dx) {
      flag = true;
      Types[i].x_old=Types[i].x_new;
    }
    if (abs(Types[i].y_new-Types[i].y_old)>dy) {
      flag = true;
      Types[i].y_old=Types[i].y_new;
    }
  }
}

void origin() {
  for (int i = 0; i < k; i++) {
    int u = int(random(0, len-1));
    int v = int(random(0, 255));
    Type T = new Type();
    T.x_old = Points[u].x;
    T.y_old = Points[u].y;
    T.r =v;
    v = int(random(0, 255));
    T.g =v;
    v = int(random(0, 255));
    T.b =v;
    Types[i] = T;
  }
  // print(Types.length);
}

void setup() {
  size(500, 500);
  background(255, 255, 255);
  font = createFont("微软雅黑", 12);
}

void draw() {
  textFont(font);
  if (keyPressed) {
    if (key == 'S' || key == 's') {
      int itera=0;
      background(255, 255, 255);
      origin();
      nearK();
      renew();
      for (int i = 0; i <iteration; i++) {
        itera++;
        if (flag) {
          flag=false;
          nearK();
          renew();
        } else
          break;
      }
      for (int i = 0; i < len; i++) {
        int u=Points[i].k;
        fill(Types[u].r, Types[u].g, Types[u].b);
        rect(Points[i].x, Points[i].y, 7, 7);
        textSize(20);
        text(u, Points[i].x+9, Points[i].y+10);
      }
      print("itera"+itera);
    }
  }
}

void keyPressed() {
  int p=0;
  if ((key == 'l' || key == 'L')&&flag == true && p<iteration) {
    // boolean flag=false;
    int itera=0;
    background(255, 255, 255);
    p++;
    flag=false;
    origin();
    nearK();
    renew();
    //for (int j=0; j<k; j++) {
    //  fill(255);
    //  strokeWeight(3);
    //  rect(Types[j].x_old, Types[j].y_old, 10, 10);
    //}
    for (int i = 0; i < len; i++) {
      int u=Points[i].k;
      fill(Types[u].r, Types[u].g, Types[u].b);
      strokeWeight(1);
      rect(Points[i].x, Points[i].y, 5, 5);
      textSize(10);
      text("Type: "+u, Points[i].x+9, Points[i].y+10);
    }
    for (int i=0; i<k; i++) {
      fill(255);
      strokeWeight(3);
      ellipse(Types[i].x_old, Types[i].y_old, 10, 10);
    }
    print("itera"+itera);
  }
}
