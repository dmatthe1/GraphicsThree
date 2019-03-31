float theta = 0;
Star[] stars = new Star[800];

void setup() {
  size(1500, 800);
  //noStroke();
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  //basic formatting setup
  background(0);
  translate(width/2, height/2);
  
  //sun
  fill(249, 215, 28);
  ellipse(0, 0, 200, 200);
  
  //Mercury
  pushMatrix();
  rotate(theta*1.6);
  translate(150, 0);
  fill(181, 167, 167);
  ellipse(0, 0, 10, 10);
  popMatrix();
  
  //Venus
  pushMatrix();
  rotate(theta);
  translate(175, 0);
  fill(139,125,130);
  ellipse(0, 0, 13, 13);
  popMatrix();
  
  //Earth
  pushMatrix();
  rotate(theta*1.2);
  translate(200, 0);
  fill(50, 200, 255);
  ellipse(0, 0, 20, 20);
  
    pushMatrix(); 
    rotate(-theta*4);
    translate(13, 0);
    fill(50, 255, 200);
    ellipse(0, 0, 4, 4);
    popMatrix();
  
  /**
    // Moon #2 also rotates around the earth
    pushMatrix();
    rotate(theta*2);
    translate(30, 0);
    fill(50, 255, 200);
    ellipse(0, 0, 6, 6);
    popMatrix();
  **/
  
  popMatrix();
  
  //Mars
  pushMatrix();
  rotate(theta*1.5);
  translate(250, 0);
  fill(161, 37,27);
  ellipse(0, 0, 20, 20);
  popMatrix();
  
  //Saturn
  pushMatrix();
  rotate(theta*0.8);
  translate(300, 0);
  fill(206,184,184);
  ellipse(0, 0, 30, 30);
  noFill();
  stroke(255);
  ellipse(0, 0, 34, 34);
  
  popMatrix();
  
  //Pluto
  pushMatrix();
  rotate(theta*3);
  translate(400, 0);
  fill(50, 255, 200);
  ellipse(0, 0, 6, 6);
  popMatrix();


for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
  
  theta += 0.01;
  noStroke();
}
