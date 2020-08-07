import processing.svg.*;

void setup() {
  size(1000, 600);
  noLoop();
  beginRecord(SVG, "export.svg");
  noFill();
  strokeWeight(2);
}

void draw() {
  float size = 40;
  float margin = 40;

  //max int which can be represented with 8 bits = 255
  int max = 255;

  for (int i = 0; i<=max; i++) {
    float x = margin + 1.1 * size * (i % 20);
    float y = margin + 1.1 * size * int(i/20);

    print("The binary representation of " + i +" is ");
    for (int k = 7; k >= 0; k--) {
      int bitValue = getBit(i, k);
      print(bitValue);
      if (bitValue == 1)
        drawSymbol(x, y, size, k);
    }
    println("");
  }
  endRecord();//saves the SVG file
}

//Draws 8 different symbols, according to k
void drawSymbol(float x, float y, float size, int k) {
  pushMatrix();
  translate(x, y);
  switch(k) {
  case 0: //horizontal line
    line(-size/2, 0, size/2, 0);
    break;
  case 1: //vertical line
    line(0, -size/2, 0, size/2);
    break;
  case 2: // square
    rect(-size/2, -size/2, size, size);
    break;
  case 3: //circle
    circle(0, 0, size*.75);
    break;
  case 4: //diagonal "down"
    line(-size/2, -size/2, size/2, size/2);
    break;
  case 5: //diagonal "up"
    line(-size/2, +size/2, size/2, -size/2);
    break;
  case 6: //smaller circle
    circle(0, 0, size/3);
    break;
  case 7: //"diamond" (rotate square)
    rotate(PI/4);
    rect(-size/4, -size/4, size/2, size/2);
    break;
  default:
    println("Hmmm something went wrong!"); //not throwing exception to make it simple
  }
  popMatrix();
}

//For a given integer "n", returns the the value (0 or 1) of the kth bit of "n" represented in binary
//Source:https://stackoverflow.com/questions/14145733/how-can-one-read-an-integer-bit-by-bit-in-java/14145767
int getBit(int n, int k) {
  return (n >> k) & 1;
}
