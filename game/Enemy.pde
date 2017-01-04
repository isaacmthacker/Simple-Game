class Enemy {
  float x;
  float y;
  float vel = 1.0;
  float r = 10;

  Enemy(float xx, float yy, boolean leftSideOfScreen) {
    if (leftSideOfScreen) {
      vel = -vel;
    }
    x = xx;
    y = yy;
  }


  void move() {
    x += vel;
  }
  void draw() {
    fill(0, 0, 255);
    ellipse(x, y, r, r);
  }
}