//rotation variables
float x;
float y;
float tempX;
float tempY;
PVector rotAxis;
PVector cameraVector;
PVector verticalVect;
PVector horizontalVect;
float angle;
float theta = 0;
boolean spinning = false;
boolean inRotateMode;


//system variables
ArrayList<TexturePlanet> system;
Star[] stars = new Star[800];
int planetSwitch = 0;

void setup(){
  //canvas setup
  size(1500, 1000, P3D);
  noStroke();
  sphereDetail(30);
  smooth();
  verticalVect = new PVector(0, 1, 0);
  horizontalVect = new PVector(1, 0, 0);
  angle = 0;
  //rotation setup
  x = width/2;
  y = height/2;
  tempX = width/2;
  tempY = height/2;
  inRotateMode = false;
  
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
      new Ring(10, 0.45, 350, color(139, 69, 19), 5, 155),
      new Ring(10, 0.45, 400, color(205,133,63), 5, 205),
      new Ring(10, 0.45, 450, color(222,184,135), 5, 255),
    /*
      new Ring(10, 0.45, 350, color(72,0,72), 5, 155),
      new Ring(10, 0.45, 400, color(200,0,200), 5, 205),
      new Ring(10, 0.45, 450, color(128,0,128), 5, 255),
      */
  })); 
  
  
  //Uranus
  system.add(new TexturePlanet("Uranus", 50, 30, loadImage("uranus.jpg"), 0.748, 4500));
  
  //Neptune
  system.add(new TexturePlanet("Neptune", 50, 30, loadImage("neptune.jpeg"), 0.802, 5000));  
  
  //Star Additions
  for (int i = 0; i < stars.length; i++) stars[i] = new Star(upperL, lowerL, createShape(SPHERE,5), loadImage("meteor.jpg"));
  translate(width/2, height/2);
  pushMatrix();
}

void draw(){
  popMatrix();
  textureMode(NORMAL);
  
  //Camera 
  if(! inRotateMode){
    TexturePlanet focus = system.get(planetSwitch);
    float currX = focus.getX(theta);
    float currY = focus.getY(theta);
    
    camera(currX, currY + focus.sph.r * 10, height, currX, currY, 0, 0, 1, 0);
    println("Not in Rotate Mode");
    /*
    float eyeX = currX;
    float eyeY = currY + focus.sph.r * 10;
    float eyeZ = height;
    float centerX = currX;
    float centerY = currY;
    float centerZ = 0;
    */
  }
  else {
    //camera(0.0, 5000.0, 1000.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
    //Leave this commented out^
    println("In Rotate Mode");
  }
  //println(eyeX + " " + eyeY + " " + eyeZ + " " + centerX + " " + centerY);
  
  //cameraVector = new PVector(eyeX-centerX, eyeY-centerY, eyeZ - centerZ);
  //Fills
  background(0);
  
  if(mousePressed == true && inRotateMode){
    
    float diffX = mouseX - pmouseX;
    float diffY = mouseY - pmouseY;
    if(diffX != 0 && diffY != 0){
      float totalDist = sqrt(diffX*diffX + diffY*diffY);
      angle = totalDist/width;
      
      PVector distVect = (horizontalVect.copy()).mult(diffX).add((verticalVect.copy()).mult(diffY)); 
      cameraVector = (horizontalVect.copy()).cross(verticalVect.copy());
      // worldspace direction mouse moved ^^

      rotAxis = distVect.cross(cameraVector);
      rotateAroundAxis(rotAxis, angle);
      
      PMatrix3D reset = new PMatrix3D();
      reset.rotate(-angle, rotAxis.x, rotAxis.y, rotAxis.z);
      reset.mult(horizontalVect, horizontalVect);
      reset.mult(verticalVect, verticalVect);
    }

  }
  
  //translate(-currX, -currY);
  
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
  pushMatrix();
  //Incrementing Rotation
  if (spinning) theta += 0.001;
  else theta = 0;
  /*
  fill(255);
  
  textAlign(CENTER);
  textSize(30);
  text("Solar System", width/2, height-50);
  textSize(15);
  text("Focusing on " + focus.name, width/2, height-30);
  */
}

void keyPressed() {
  if (key == 'm' && ! inRotateMode) {
    if (planetSwitch < system.size() - 1) planetSwitch++;
    else planetSwitch = 0;
  }
  if (key == 'n') {
     spinning = !spinning; 
  }
  if(key == 'r') {
    if(inRotateMode) inRotateMode = false;
    else {
      inRotateMode = true;
      planetSwitch = 0;
      //Change planetSwitch to be the Sun
    }
  }
}

void rotateAroundAxis(PVector axis, float th){
    PVector w = axis.copy();
    w.normalize();
    PVector t = w.copy();
    if (abs(w.x) - min(abs(w.x), abs(w.y), abs(w.z)) < 0.001) {
      t.x = 1;
    } else if (abs(w.y) - min(abs(w.x), abs(w.y), abs(w.z)) < 0.001) {
      t.y = 1;
    } else if (abs(w.z) - min(abs(w.x), abs(w.y), abs(w.z)) < 0.001) {
      t.z = 1;
    }
    PVector u = w.cross(t);
    u.normalize();
    PVector v = w.cross(u);
    applyMatrix(u.x, v.x, w.x, 0, 
                u.y, v.y, w.y, 0, 
                u.z, v.z, w.z, 0, 
                0.0, 0.0, 0.0, 1);
    rotateZ(th);
    applyMatrix(u.x, u.y, u.z, 0, 
                v.x, v.y, v.z, 0, 
                w.x, w.y, w.z, 0, 
                0.0, 0.0, 0.0, 1);
}
