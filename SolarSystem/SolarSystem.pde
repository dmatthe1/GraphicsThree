//rotation variables
float x;
float y;
float tempX;
float tempY;

//system variables
ArrayList<Planet> system;
Star[] stars = new Star[100];
float theta = 0;

void setup(){
  //canvas setup
  size(1500, 1000, P3D);
  noStroke();
  sphereDetail(30);
  smooth();
  
  //rotation setup
  x = width/2;
  y = height/2;
  tempX = width/2;
  tempY = height/2;
  
  //Planet Additions
  system = new ArrayList<Planet>();
  system.add(new Planet(loadImage("sun.jpg"), createShape(SPHERE,300), 0, 0)); //Sun
  system.add(new Planet(loadImage("earth.png"), createShape(SPHERE,100), 1, 1500, new Planet[]{
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,20), 365, 150, new Planet[]{})
  })); //Earth
  system.add(new Planet(loadImage("ball.jpg"), createShape(SPHERE,30), 1.2, 1000)); 
  system.add(new Planet(loadImage("ball.jpg"), createShape(SPHERE,10), -.7, 1100)); 
  system.add(new Planet(loadImage("momo.jpg"), createShape(SPHERE,150), 0.5, 2000, new Ring[]{
      new Ring(10, 0.45, 350, color(72,0,72)),
      new Ring(10, 0.45, 400, color(128,0,128)),
      new Ring(10, 0.45, 450, color(200,0,200))
  })); 
  
  //Star Additions
  for (int i = 0; i < stars.length; i++) stars[i] = new Star( createShape(SPHERE,5));
}

void draw(){
  //Camera 
  camera(x, y, height, width/2, height/2, 0, 0, 1, 0);
  
  //Fills
  background(0);
  lights();
  
  //Basic Transformations
  translate(width/2, height/2);
  //rotateY(-radians(0.5* frameCount));

  //Rotation
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
  
  //Star System Drawing
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }

  //Planet System Drawing
  for (Planet planet : system) {
     pushMatrix();
     planet.display();
     
     for (Ring ring : planet.rings) ring.display();
     
     for (Planet moon : planet.moons) {
       pushMatrix();
       rotate(theta * moon.speed);
       translate(moon.translation, 0);
       shape(moon.globe);
       popMatrix();
     }
     popMatrix();
  }
  
  //Incrementing Rotation
  theta += 0.01;
}

void keyPressed() {
  println("ib here");
   translate(500, 0); 
}
