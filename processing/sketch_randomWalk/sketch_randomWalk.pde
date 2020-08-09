import processing.svg.*;

void setup() {
  String seed = "2020-08-01";
  randomSeed(2020 - 8 - 1);
  size(400, 400);
  noLoop();
  beginRecord(SVG, "export"+seed+".svg");
  noFill();
  strokeWeight(2);
}

void draw() {
  
  int margin = 25;
  int max = 100;
  int last_x = int(random(margin, 400 - margin));
  int last_y = int(random(margin, 400 - margin));

  for (int i = 0; i<=max; i++) {    
    int x = int(random(margin, 400 - margin));
    int y = int(random(margin, 400 - margin));
    
    line(last_x, last_y, x, y);
    
    last_x = x;
    last_y = y;
  }
  endRecord();//saves the SVG file
}
