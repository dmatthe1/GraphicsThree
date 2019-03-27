
void setup() {
  size(800, 800, P3D);
  //noStroke();
}

void draw() {
  //basic formatting setup
  background(0);
  
  camera(width/2, map(mouseY, 0 , height, - height, height), 
  height, width/2, height/2, 0, 
  0, 1, 0);
  translate(width/2, height/2);
  
  //lighting
  pointLight(255, 255, 255, width/2, map(mouseY,0, height, - height, height), height);
  
/*
  //camera setup
  ortho(-width, width, -height, height);
  frustum(-width, width, -height, height, 1000, 10000);
  
*/
  
  
  //mouse-based rotation
  //rotateY(map(mouseX, 0, width, 0, TWO_PI));
  //rotateX(map(mouseY, 0, height, 0, TWO_PI));
  
  //sphere creation
  fill(80, 80 ,200);
  sphere(200);
}
