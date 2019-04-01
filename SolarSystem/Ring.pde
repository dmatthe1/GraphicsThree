class Ring {
  float weight;
  float rotation;
  float size;
  color col;
  
  Ring(float w, float r, float s, color c) {
    weight = w;
    rotation = r;
    size = s;
    col = c;
  }
  
  void display() {
    pushMatrix();
    stroke(col);
    strokeWeight(weight);
    noFill();
    rotateX(HALF_PI-rotation);
    ellipse(0,0, size, size);
    popMatrix();
  }
}
