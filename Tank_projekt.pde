PImage tankImage;
PlayerTank playerTank;
ArrayList<Kugle> bullets = new ArrayList<Kugle>();

void setup() {
  fullScreen();
  background(0);
  tankImage = loadImage("tank1.png");
  tankImage.resize(tankImage.width/2, tankImage.height/2);
  playerTank = new PlayerTank(width/2, height/2, tankImage);
}

void draw() {
  background(0);
  playerTank.display();
  playerTank.update();
  playerTank.move();

  for (int i = bullets.size()-1; i >= 0; i--) {
    Kugle b = bullets.get(i);
    b.update();
    b.display();
    if (b.done()) {
      bullets.remove(i);
    }
  }
}
