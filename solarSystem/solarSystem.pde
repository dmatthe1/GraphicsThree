float x;
float y;
float tempX;
float tempY;

void setup(){
  size(1000, 1000, P3D);
  x = width/2;
  y = height/2;
  tempX = width/2;
  tempY = height/2;
}

void draw(){
  camera(x, y, height, 
        width/2, height/2, 0,
        0, 1, 0);
  background(0);
  translate(width/2, height/2);
  //noStroke(); 

  if(mousePressed == true){
    rotateX(-map(mouseY, 0, height, 0, TWO_PI));
    rotateY(-map(mouseX, 0, width, 0, TWO_PI));
    tempX = -map(mouseY, 0, height, 0, TWO_PI);
    tempY = -map(mouseX, 0, width, 0, TWO_PI);
  }
  else {
    rotateX(tempX);
    rotateY(tempY);
  }
  
  sphere(100);
}
