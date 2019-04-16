class Ring {
  float weight;
  float rotation;
  float size;
  color col;
  //PImage img = loadImage("saturn.jpg");
  PVector vertices[], vertices2[];
  int pts = 40; 
  float angle = 0;
  float radius; //default 10

  // lathe segments
  int segments = 60;
  float latheAngle = 0;
  float latheRadius; //default 200
  
  Ring(float w, float r, float s, color c, float rad, float lRad) {
    weight = w;
    rotation = r;
    size = s;
    col = c;
    radius = rad; //how thin the ring is
    latheRadius = lRad; //how big the ring is
  }
  
  void display() {
    pushMatrix();
    stroke(col);
    strokeWeight(weight);
    noFill();
    rotateX(HALF_PI-rotation);
    //ellipse(0,0, size, size);
    makeTorus();
    popMatrix();
  }
  
  void makeTorus(){
    vertices = new PVector[pts+1];
    vertices2 = new PVector[pts+1];
  
    // fill arrays
    for(int i=0; i<=pts; i++){
      vertices[i] = new PVector();
      vertices2[i] = new PVector();
      vertices[i].x = latheRadius + sin(radians(angle))*radius;
      vertices[i].z = cos(radians(angle))*radius;
      
      angle+=360.0/pts;
    }
  
    // draw toroid
    latheAngle = 0;
    for(int i=0; i<=segments; i++){
      beginShape(QUAD_STRIP);
      for(int j=0; j<=pts; j++){
        if (i>0){
          vertex(vertices2[j].x, vertices2[j].y, vertices2[j].z);
        }
        vertices2[j].x = cos(radians(latheAngle))*vertices[j].x;
        vertices2[j].y = sin(radians(latheAngle))*vertices[j].x;
        vertices2[j].z = vertices[j].z;
        // optional helix offset
        vertex(vertices2[j].x, vertices2[j].y, vertices2[j].z);
      }
      // create extra rotation for helix
      latheAngle+=360.0/segments;
      
      endShape();
    }
  }
}
