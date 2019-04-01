
float speed = 6;

class Star {
  //location
  float x;
  float y;
  float z;

  //previous location
  float pz;
  
  //color
  int c;


  Star() {
    //location setting
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = random(width/2);
    pz = z;
    
    //color setting
    if (random(0, 100) < 60) c = 255;
    else c = 0;
  }

  void update() {
    //tick movement
    z = z - speed;
    
    //respawn
    if (z < 1) {
      z = width/2;
      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
      pz = z;
    }
  }

  void show() {
    fill(255, c, c);
    noStroke();

    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);;

    //sizing the star
    float r = map(z, 0, width/2, 6, 0);
    
    ellipse(sx, sy, r, r);

    float px = map(x / pz, 0, 1, 0, width/2);
    float py = map(y / pz, 0, 1, 0, height/2);

    pz = z;

    //star tail
    stroke(255, 255, c);
    line(px, py, sx, sy);
  }
}
