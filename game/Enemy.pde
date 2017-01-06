class Enemy {
  float x;
  float y;
  float vel = 1.0;
  float r = 25;

  Enemy(float xx, float yy, boolean leftSideOfScreen) {
    if (!leftSideOfScreen) {
      vel = -vel;
    }
    x = xx;
    y = yy;
  }

  boolean intersectBullet(Bullet b) {
    if (dist(b.x, b.y, x, y) < b.r/2.0+r/2.0) {
      return true;
    } else {
      return false;
    }
  }


  void move() {
    x += vel;
  }
  void draw() {
    fill(0, 0, 255);
    ellipse(x, y, r, r);
  }

  String toString() {
    return "<" + x + "," + y + ">";
  }
}