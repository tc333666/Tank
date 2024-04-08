class PlayerTank {
  PVector position;
  PVector velocity;
  PVector acceleration;
  PImage tankImage;
  float maxSpeed = 3; 
  float maxForce = 0.1; 
  float angle = 0; 
  float rotationSpeed = 0.1; 
  boolean[] keys = new boolean[5]; 
  int fireRate = 20; 
  
  PlayerTank(float x, float y, PImage img) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    tankImage = img;
  }
  
  void display() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    imageMode(CENTER);
    image(tankImage, 0, 0);
    popMatrix();
  }
  
  void update() {
    acceleration.set(0, 0);
    if (keys[2]) { 
      acceleration.x = cos(angle) * maxForce;
      acceleration.y = sin(angle) * maxForce;
    }
    if (keys[3]) { 
      acceleration.x = -cos(angle) * maxForce;
      acceleration.y = -sin(angle) * maxForce;
    }
    if (keys[0]) { 
      angle -= rotationSpeed;
      velocity = PVector.fromAngle(angle).setMag(velocity.mag()); // 更新速度方向
    }
    if (keys[1]) { 
      angle += rotationSpeed;
      velocity = PVector.fromAngle(angle).setMag(velocity.mag()); // 更新速度方向
    }
    if (keys[4]) { 
      if (fireRate <= 0) {
        bullets.add(new Kugle(position.x, position.y, angle));
        fireRate = 20; 
      }
    }
    fireRate--;

    position.add(velocity);
    position.x = constrain(position.x, 0, width);
    position.y = constrain(position.y, 0, height);
  }
  
  void move() {
    acceleration.limit(maxForce);
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    position.add(velocity);
    
    acceleration.set(0, 0);
    

    if (!keys[2]) { 
      velocity.set(0, 0);
    }
  }
}
