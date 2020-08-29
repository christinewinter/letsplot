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
  size(500, 500);
  noLoop();
  beginRecord(SVG, "export_"+y+"_"+m+"_"+d+".svg");
  noFill();
  strokeWeight(2);
}

void draw() {
  // draw random lines with random color, 
  // generated from input date, default date is run date
  
  int margin = 2;
  int radius = 50;
  background(51);
  
  for (int i = 0; i<=1; i++) {
    for (int j =0; j<= 1; j++){
      //fill(204, 102, 0);
      colourPicker(i,j);
      noStroke();
      circle(i*(radius+margin)+10, j*(radius+margin)+margin, radius);
    }
  }
  endRecord();//saves the SVG file
}

void colourPicker(int i, int j){
  if (isEven(i) + isEven(j) == 0) {
    fill(237, 171, 157);
  }
  if (isEven(i) + isEven(j) == 1) {
    fill(123, 121, 219);
  }
  if (isEven(i) + isEven(j) == 2) {
    fill(121, 219, 180);
  }
}

int isEven(int k){
  return 1 - k%2; 
}
