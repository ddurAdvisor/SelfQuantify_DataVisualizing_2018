// Line graph of NYC education data
// using Processing v2.1
// source: https://nycopendata.socrata.com/Education/Math-Test-Results-2006-2012-Citywide-SWD/ufu7-zp25?

String filename = "test_results.csv";
String[] rawData;
ArrayList<Grade> allGrades = new ArrayList<Grade>();
int[] mins = new int[6];
int[] maxs = new int[6];
int overallMin, overallMax;
int currLevel;

float xSpacer, ySpacer;



void setup() {
  size(800, 500);
  smooth();

  rawData = loadStrings(filename);
  //printArray(rawData);
  processData();
  currLevel = 6;
}

void draw() {
  background(40);

  drawGUI();
  for (Grade g : allGrades) {
    g.display();
  }
}

void drawGUI() {
  stroke(100);
  fill(200);
  int[] years = {
    2006, 2007, 2008, 2009, 2010, 2011, 2012
  };
  int[] grades = {
    3, 4, 5, 6, 7, 8
  };

  // x-axis (7 years)
  for (int x=0; x<years.length; x++) {
    float xPos = xSpacer + (xSpacer * x);
    line(xPos, height - ySpacer, xPos, ySpacer);
    text(years[x], xPos-15, height - ySpacer +20);
  }

  text("SELECT GRADE TO VIEW: ", 50, 25);
}

void processData() {
  // create objects for grade levels
  for (int i=1; i<rawData.length; i+=7) {
    Grade g = new Grade();
    String[] firstRow = split(rawData[i], ",");
    //printArray(splitData);
    g.level = int(firstRow[0]);
    for (int j=0; j<7; j++) {
      String[] splitRow = split(rawData[i+j], ",");
      g.scores[j] = int(splitRow[2]);
    }
    g.setMinMax();
    allGrades.add(g);
  }

  xSpacer = width / (7 + 1);
  ySpacer = height / (allGrades.size() + 1);

  for (int i=0; i<6; i++) {
    Grade g = allGrades.get(i);
    mins[i] = g.min;
    maxs[i] = g.max;
  }

  overallMin = min(mins);
  overallMax = max(maxs);

  for (Grade g : allGrades) {
    g.setValues();
  }
}

void mouseReleased() {
  for (Grade g: allGrades) {
    if (dist(mouseX, mouseY, g.button.x, g.button.y) < g.buttonRadius) {
      g.selected = true;
      currLevel = g.level;
    } 
    else {
      g.selected = false;
    }
  }
}

