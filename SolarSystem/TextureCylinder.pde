class TextureCylinder{
  PImage img;
  String name; 
  
  //positioning 
  float speed;
  float translation;
  float rad;
  float h;
  
  int tubeRes = 32;
  float[] tubeX = new float[tubeRes];
  float[] tubeY = new float[tubeRes];
  
   TextureCylinder(String name, float radius, float hei, int numSegments, PImage img, float speed, float translation) {
     this.img = img;
     this.speed = speed;
     this.translation = translation;
     this.name = name;
     this.rad = radius;
     this.h = hei;
  } 
  
  void display(){
    float angle = 270.0 / tubeRes;
    for (int i = 0; i < tubeRes; i++) {
      tubeX[i] = cos(radians(i * angle));
      tubeY[i] = sin(radians(i * angle));
    }
    noStroke();
    
    beginShape(QUAD_STRIP);
    texture(img);
    float x=0;
    float z=0;
    float u=0;
    for (int i = 0; i < 50; i++) {
      x = tubeX[i%tubeRes] * rad;
      z = tubeY[i%tubeRes] * rad;
      u = img.width / tubeRes * i;
      vertex(x, 273-h, z, u, 0);
      vertex(x, 100, z, u, img.height);
    }
    vertex(x, -100, z, u, 0);
    vertex(x, 100, z, u, img.height);
    
    endShape();
    
  }
    
  float getX(float theta) {
    return translation * cos(theta * speed);
  }
  
  float getY(float theta) {
    return translation * sin(theta * speed);
  }
}
