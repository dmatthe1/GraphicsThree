float speed = 6;

class Star {
  //location
  float x;
  float y;
  float z;

  PShape model; 
  
  //previous location
  float pz;
  
  //color
  int c;


  Star(PShape model) {
    //location setting
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = 0;
    pz = z;
    this.model = model;
  }

  void update() {
    //tick movement
    z = z - speed;
    
    //respawn
    if (x > width || x < 0 || y > height || y < 0) {
      z = width/2;
      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
      pz = z;
    }
  }

  void show() {
    fill(255, 255, 255);
    noStroke();

    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);;

    //sizing the star
    float r = map(z, 0, width/2, 6, 0);
    
    ellipse(sx, sy, r, r);

    float px = map(x / pz, 0, 1, 0, width/2);
    float py = map(y / pz, 0, 1, 0, height/2);

    pz = z;
    shape(model);
    //star tail
    stroke(255, 255, 255);
    line(px, py, sx, sy);
  }
}
