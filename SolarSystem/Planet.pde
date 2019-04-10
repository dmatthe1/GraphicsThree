class Planet {  
  //color
  PImage img;
  PShape globe; 
  TextureSphere sph;
  
  //positioning 
  float speed;
  float translation;
  
  //moons
  Planet[] moons;
  Ring[] rings;
 
  float x = 0;
  float y = 0;
 
  //No rings or moons
  Planet(PImage img, PShape globe, float speed, float translation) {
     this.img = img;
     this.globe = globe;
     this.speed = speed;
     this.translation = translation;
     
     this.moons = new Planet[]{};
     this.rings = new Ring[]{};
     
     globe.setTexture(img);
  } 
  
  //No moons
  Planet(PImage img, PShape globe, float speed, float translation, Ring[] rings) {
     this.img = img;
     this.globe = globe;
     this.speed = speed;
     this.translation = translation;
     this.rings = rings;
     
     this.moons = new Planet[]{};  
     
      globe.setTexture(img);
  }
  
  //No rings
  Planet(PImage img, PShape globe, float speed, float translation, Planet[] moons) {
     this.img = img;
     this.globe = globe;
     this.speed = speed;
     this.translation = translation;
     this.moons = moons;
     
     this.rings = new Ring[]{};
     
     globe.setTexture(img);
  }
  
  //Rings and moons
  Planet(PImage img, PShape globe, float speed, float translation, Planet[] moons, Ring[] rings) {
     this.img = img;
     this.globe = globe;
     this.speed = speed;
     this.translation = translation;
     this.moons = moons;
     this.rings = rings;
     
     globe.setTexture(img);
  }
  
  void setTexture(PImage img, PShape globe) {
    
  }
  
  void display() {
     shape(globe); 
  }
}
