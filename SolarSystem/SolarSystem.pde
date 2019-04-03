//rotation variables
float x;
float y;
float tempX;
float tempY;

//system variables
ArrayList<Planet> system;
Star[] stars = new Star[800];
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
  
  //Sun
  system.add(new Planet(loadImage("sun.jpg"), createShape(SPHERE,200), 0, 0)); 
  
  //Mercury
  system.add(new Planet(loadImage(""), createShape(SPHERE,20), 58.8, 800)); 
  
  //Venus
  system.add(new Planet(loadImage(""), createShape(SPHERE,20), 244, 1000)); 
  
  //Earth
  system.add(new Planet(loadImage("earth.png"), createShape(SPHERE,100), 1, 1300, new Planet[]{
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,20), 10, 150, new Planet[]{})
  })); 
  
  //Mars
  system.add(new Planet(loadImage(""), createShape(SPHERE,100), 1.029, 1800, new Planet[]{
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,20), 10, 150, new Planet[]{}),
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,20), 10, 200, new Planet[]{})
  })); 
  
  //Jupiter
  system.add(new Planet(loadImage(""), createShape(SPHERE, 200), 0.411, 2000, new Planet[]{
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,6), 10, 150, new Planet[]{}),
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,6), 10, 260, new Planet[]{}),
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,6), 10, 170, new Planet[]{}),
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,6), 10, 180, new Planet[]{}),
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,6), 10, 190, new Planet[]{}),
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,6), 10, 200, new Planet[]{}),
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,6), 10, 210, new Planet[]{}),
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,6), 10, 220, new Planet[]{}),
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,6), 10, 230, new Planet[]{}),
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,6), 10, 240, new Planet[]{}),
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,6), 10, 250, new Planet[]{}),
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,6), 10, 260, new Planet[]{}),
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,6), 10, 270, new Planet[]{}),
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,6), 10, 280, new Planet[]{}),
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,6), 10, 290, new Planet[]{}),
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,6), 10, 300, new Planet[]{}),
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,6), 10, 310, new Planet[]{}),
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,6), 10, 350, new Planet[]{}),
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,6), 10, 360, new Planet[]{}),
      new Planet(loadImage("moon.jpg"), createShape(SPHERE,6), 10, 370, new Planet[]{})
  })); 
  
  //Saturn
  system.add(new Planet(loadImage("momo.png"), createShape(SPHERE,150), 0.428, 2500, new Ring[]{
      new Ring(10, 0.45, 350, color(72,0,72)),
      new Ring(10, 0.45, 375, color(128,0,128)),
      new Ring(10, 0.45, 400, color(200,0,200)),
      new Ring(10, 0.45, 425, color(72,0,72)),
      new Ring(10, 0.45, 450, color(128,0,128)),
      new Ring(10, 0.45, 475, color(200,0,200))
  })); 
  
  
  //Uranus
  system.add(new Planet(loadImage(""), createShape(SPHERE,30), 0.748, 3000));
  
  //Neptune
  system.add(new Planet(loadImage(""), createShape(SPHERE,30), 0.802, 3000)); 
  
  //Pluto
  system.add(new Planet(loadImage(""), createShape(SPHERE,10), 0.267, 4000)); 
  
  
  //Star Additions
  for (int i = 0; i < stars.length; i++) stars[i] = new Star(upperL, lowerL, createShape(SPHERE,5), loadImage("meteor.jpg"));
}

void draw(){
  //Camera 
  camera(x, y, height, width/2, height/2, 0, 0, 1, 0);
  
  //Fills
  background(0);
  lights();
  
  
  //Basic Transformations
  translate(width/2, height/2);
  rotateY(-radians(0.5*frameCount));

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
  for (Star star : stars) {
    star.update();
    star.show();
  }
  
  emissive(150, 0, 100);

  //Planet System Drawing
  for (Planet planet : system) {
     pushMatrix();
     planet.display();
     
     for (Ring ring : planet.rings) ring.display();
     
     pushMatrix();
     for (Planet moon : planet.moons) {
       
       rotateX(HALF_PI-0.45);
       rotate(theta * moon.speed);
       translate(moon.translation, 0);
       shape(moon.globe);
     }
     popMatrix();
     popMatrix();
  }
  
  //Incrementing Rotation
  theta += 0.001;
}

void keyPressed() {
  println("ib here");
   translate(500, 0); 
}
