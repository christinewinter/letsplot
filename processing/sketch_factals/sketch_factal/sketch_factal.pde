import processing.svg.*;

void setup(){
    size(500,500);
    size(500, 500);
    noLoop();
    beginRecord(SVG, "fractal_90degrees_yellow_dmax5.svg");
    noFill();
    strokeWeight(2);
    stroke(93, 131, 166); // #5d83a6 blue
    // stroke(164, 222, 180); // #a4deb4 green
    stroke(168, 167, 118); // yellowish
}

void draw(){
    background(51);
    drawCircle(width/2, height/2,250);
    endRecord();
}

void drawCircle(float x, float y, float d){
    strokeWeight(d/10);
    ellipse(x,y,d,d);
    if(d>5){
        
        drawCircle(x+d/2,y,d/2);     
        drawCircle(x-d/2,y,d/2);
        drawCircle(x,y+d/2,d/2);
        drawCircle(x,y-d/2,d/2);
        
        drawCircle(x+d/2,y-d/2,d/2);
        drawCircle(x+d/2,y+d/2,d/2);
        drawCircle(x-d/2,y-d/2,d/2);
        drawCircle(x-d/2,y+d/2,d/2);
      }
}
