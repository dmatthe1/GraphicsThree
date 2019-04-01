

class Planet {
  //sizing
  float r;
  
  //color
  color c;
  
  //positioning 
  float speed;
  float translation;
  
  //moons
  Planet[] moons;
  
  Planet(float r, color c, float speed, float translation, Planet[] moons) {
     this.r = r;
     this.c = c;
     this.speed = speed;
     this.translation = translation;
     this.moons = moons;
  }
}
