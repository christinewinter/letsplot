import processing.svg.*;

void setup() {
  int d = day();
  int m = month();
  int y = year();

  if (args != null) {
    println(args.length);
    y = int(args[0]);
    m = int(args[1]);
    d = int(args[2]);
  }
  else {
    println("args == null");
  }
  
  // use current date to set random seed
  randomSeed(y - m - d);
  size(400, 400);
  noLoop();
  beginRecord(SVG, "export_"+y+"_"+m+"_"+d+".svg");
  noFill();
  strokeWeight(2);
}

void draw() {
  // draw random lines with random color, 
  // generated from input date, default date is run date
  
  int margin = 25;
  int max = 100;
  int last_x = int(random(margin, 400 - margin));
  int last_y = int(random(margin, 400 - margin));

  color c = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));

  drawLines(max, margin, c, last_x, last_y);
  endRecord();//saves the SVG file
}

void drawLines(int max, int margin, color c, int last_x, int last_y){
    for (int i = 0; i<=max; i++) {    
    int x = int(random(margin, 400 - margin));
    int y = int(random(margin, 400 - margin));
    strokeWeight(int(random(1, 5)));
    stroke(c);    
    line(last_x, last_y, x, y);    
    last_x = x;
    last_y = y;
  }
}
