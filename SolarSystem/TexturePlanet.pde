class TexturePlanet {  
  //color
  TextureSphere sph;
  String name; 
  
  //positioning 
  float speed;
  float translation;
  
  //moons
  TexturePlanet[] moons;
  Ring[] rings;
  TextureCylinder[] satellites;
  
  //No rings or moons
  TexturePlanet(String name, float radius, int numSegments, PImage img, float speed, float translation) {
     this.sph = new TextureSphere(radius, numSegments, img);
     this.speed = speed;
     this.translation = translation;
     this.name = name;
     
     this.moons = new TexturePlanet[]{};
     this.rings = new Ring[]{};
     this.satellites = new TextureCylinder[]{};
  }
  
  //No moons
  TexturePlanet(String name, float radius, int numSegments, PImage img, float speed, float translation, Ring[] rings) {
    this.sph = new TextureSphere(radius, numSegments, img); 
    this.speed = speed;
    this.translation = translation;
    this.rings = rings;
    this.name = name;
    
    this.moons = new TexturePlanet[]{};
    this.satellites = new TextureCylinder[]{};
  }
  
  //No rings
  TexturePlanet(String name, float radius, int numSegments, PImage img, float speed, float translation, TexturePlanet[] moons) {
    this.sph = new TextureSphere(radius, numSegments, img); 
    this.speed = speed;
    this.translation = translation;
    this.moons = moons;
    this.name = name;
    
    this.rings = new Ring[]{};
    this.satellites = new TextureCylinder[]{};
  }
  
  //Rings and moons
  TexturePlanet(String name, float radius, int numSegments, PImage img, float speed, float translation, Ring[] rings, TexturePlanet[] moons) {
    this.sph = new TextureSphere(radius, numSegments, img); 
    this.speed = speed;
    this.translation = translation;
    this.moons = moons;
    this.rings = rings;
    this.name = name;
    
    this.satellites = new TextureCylinder[]{};
  }
  
  TexturePlanet(String name, float radius, int numSegments, PImage img, float speed, float translation, TexturePlanet[] moons, TextureCylinder[] satellites) {
    this.sph = new TextureSphere(radius, numSegments, img); 
    this.speed = speed;
    this.translation = translation;
    this.moons = moons;
    this.name = name;
    this.satellites = satellites;
    
    this.rings = new Ring[]{};
  }
  
  float getX(float theta) {
    return translation * cos(theta * speed);
  }
  
  float getY(float theta) {
    return translation * sin(theta * speed);
  }
  
  void display() {
     sph.display(); 
  }
}
