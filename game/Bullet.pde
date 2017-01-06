class Bullet {
  float velx = 5.0;
  float x;
  float y;
  float r = 20;
  Bullet(float xx, float yy, boolean left) {
    x = xx;
    y = yy;
    if (left) {
      velx = -velx;
    }
  }

  void move() {
    x += velx;
  }
  void draw() {
    fill(255, 0, 0);
    ellipse(x, y, r, r);
  }
}