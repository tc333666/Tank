class Kugle {
  PVector position;
  PVector velocity;
  float radius = 10;
  int lifespan = 255; 
  
  Kugle(float x, float y, float angle) {
    float xOffset = cos(angle) * 30; 
    float yOffset = sin(angle) * 30; 
    position = new PVector(x + xOffset, y + yOffset);
    

    velocity = PVector.fromAngle(angle).mult(10);
  }
  
  void update() {
    position.add(velocity); 
    lifespan--; 
  }
  
  void display() {
    noStroke();
    fill(255, lifespan);
    ellipse(position.x, position.y, radius*2, radius*2); // 绘制子弹
  }
  
  boolean done() {
    return lifespan <= 0; 
  }
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
    playerTank.keys[0] = true;
  }
  if (key == 'd' || key == 'D') {
    playerTank.keys[1] = true;
  }
  if (key == 'w' || key == 'W') {
    playerTank.keys[2] = true;
  }
  if (key == 's' || key == 'S') {
    playerTank.keys[3] = true;
  }
  if (key == ' ') { 
    playerTank.keys[4] = true;
  }
}

void keyReleased() {
  if (key == 'a' || key == 'A') {
    playerTank.keys[0] = false;
  }
  if (key == 'd' || key == 'D') {
    playerTank.keys[1] = false;
  }
  if (key == 'w' || key == 'W') {
    playerTank.keys[2] = false;
  }
  if (key == 's' || key == 'S') {
    playerTank.keys[3] = false;
  }
  if (key == ' ') { 
    playerTank.keys[4] = false;
  }
}
