//rotation variables
float x;
float y;
float tempX;
float tempY;
float theta = 0;
boolean spinning = false;

//system variables
ArrayList<TexturePlanet> system;
Star[] stars = new Star[800];
int planetSwitch = 6;

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
  system = new ArrayList<TexturePlanet>();
  
  //TexturePlanet
  system.add(new TexturePlanet("Sun", 500, 60, loadImage("sun.jpg"), 0, 0));
  
  //Mercury
  system.add(new TexturePlanet("Mercury", 40, 30, loadImage("mercury.jpg"), 58.8, 1500)); 
  
  //Venus
  system.add(new TexturePlanet("Venus", 40, 30, loadImage("venus.jpg"), 244, 1700)); 
  
  //Earth
  system.add(new TexturePlanet("Earth", 70, 30, loadImage("earth.jpg"), 1, 1930, new TexturePlanet[]{
      new TexturePlanet("Moon", 20, 30, loadImage("moon.jpg"), 10, 150)
  })); 
  
  //Mars
  system.add(new TexturePlanet("Mars", 70, 30, loadImage("mars.jpg"), 1.029, 2410, new TexturePlanet[]{
    
  })); 
  
  //Jupiter
  system.add(new TexturePlanet("Jupiter", 150, 30, loadImage("jupiter.jpg"), 0.411, 2800, new TexturePlanet[]{
  })); 
  
  //Saturn
  system.add(new TexturePlanet("Saturn", 130, 30, loadImage("saturn.jpg"), 0.428, 3500, new Ring[]{
      new Ring(10, 0.45, 350, color(72,0,72)),
      new Ring(10, 0.45, 400, color(200,0,200)),
      new Ring(10, 0.45, 450, color(128,0,128)),
  })); 
  
  
  //Uranus
  system.add(new TexturePlanet("Uranus", 50, 30, loadImage("uranus.jpg"), 0.748, 4500));
  
  //Neptune
  system.add(new TexturePlanet("Neptune", 50, 30, loadImage("neptune.jpeg"), 0.802, 5000));  
  
  //Star Additions
  for (int i = 0; i < stars.length; i++) stars[i] = new Star(upperL, lowerL, createShape(SPHERE,5), loadImage("meteor.jpg"));
}

void draw(){
  
  pushMatrix();
  textureMode(NORMAL);
  
  
  translate(width/2, height/2);
  
  //Camera 
  TexturePlanet focus = system.get(planetSwitch);
  float currX = focus.getX(theta);
  float currY = focus.getY(theta);
  camera(currX, currY + focus.sph.r * 10, height, currX, currY, 0, 0, 1, 0);
  
  //Fills
  background(0);
  //lights();
  
  translate(currX, currY);

  //Rotation
  if(mousePressed == true){
    rotateX(-map(mouseY, 0, height, 0, TWO_PI));
    rotateY(-map(mouseX, 0, width, 0, TWO_PI));
    tempX = -map(mouseY, 0, height, 0, TWO_PI);
    tempY = -map(mouseX, 0, width, 0, TWO_PI);
  }
  else {
    //rotateX(-radians(0.5*frameCount));
    rotateZ(radians(0.5*frameCount));
    //rotateX(tempX);
    //rotateY(tempY);
  }
  
  translate(-currX, -currY);
  
   //Star System Drawing
  for (Star star : stars) {
    star.update();
    star.show();
  }
  
  emissive(150, 0, 100);


  //Planet System Drawing
  for (TexturePlanet planet : system) {
     pushMatrix();
     if (spinning) rotate(theta * planet.speed);
     translate(planet.translation, 0);
     planet.display();
     
     for (Ring ring : planet.rings) ring.display();
     
     pushMatrix();
     for (TexturePlanet moon : planet.moons) {
       if (spinning) rotate(theta * moon.speed);
       else rotate(theta);
       translate(moon.translation, 0);
       moon.display();
     }
     popMatrix();
     popMatrix();
  }
  
  popMatrix();
  //Incrementing Rotation
  if (spinning) theta += 0.001;
  else theta = 0;
  
  fill(255);
  textAlign(CENTER);
  textSize(30);
  text("Solar System", width/2, height-50);
  textSize(15);
  text("Focusing on " + focus.name, width/2, height-30);
}

void keyPressed() {
  if (key == 'm') {
    if (planetSwitch < system.size() - 1) planetSwitch++;
    else planetSwitch = 0;
  }
  
  if (key == 'n') {
     spinning = !spinning; 
  }
}
