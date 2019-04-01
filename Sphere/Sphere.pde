float theta = 0;
Star[] stars = new Star[800];
ArrayList<Planet> system;

void setup() {
  size(1500, 800);
  
  //star initialization
  for (int i = 0; i < stars.length; i++) stars[i] = new Star();
  
  //planets
  system = new ArrayList<Planet>();
  system.add(new Planet(200, color(249, 215, 28), 0, 0, new Planet[]{})); //Sun
  system.add(new Planet(10, color(181, 167, 167), 1.6, 150, new Planet[]{})); //Mercury
  system.add(new Planet(13, color(139,125,130), 1, 175, new Planet[]{})); //Venus
    system.add(new Planet(20, color(50, 200, 255), 1.2, 200, new Planet[]{
       new Planet(4, color(50, 255, 200), 4, 13, new Planet[]{})
    })); //Earth
  system.add(new Planet(20, color(161, 37,27), 1.5, 250, new Planet[]{})); //Mars
  system.add(new Planet(34, color(206,184,184), 0.8, 300, new Planet[]{})); //Saturn
  system.add(new Planet(6, color(50, 255, 200), 3, 400, new Planet[]{})); //Pluto
}

void draw() {
  //basic formatting setup
  background(0);
  translate(width/2, height/2);
  
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
  
  noStroke();
  
  for (Planet planet : system) {
     pushMatrix();
     rotate(theta * planet.speed);
     translate(planet.translation, 0);
     fill(planet.c);
     ellipse(0, 0, planet.r, planet.r);
     
     for (Planet moon : planet.moons) {
       pushMatrix();
       rotate(theta * moon.speed);
       translate(moon.translation, 0);
       fill(moon.c);
       ellipse(0, 0, moon.r, moon.r);
       popMatrix();
     }
     
     popMatrix();
  }
  
  theta += 0.01;
  noStroke();
}
