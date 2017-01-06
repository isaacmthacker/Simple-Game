class Player {
  float x;
  float y;
  float r = 40;
  float moveAmt = 3.0;
  boolean shootLeft = true;
  boolean movingLeft = true;

  Player(float xx, float yy) {
    x = xx;
    y = yy;
  }
  void moveRight() {
    x += moveAmt;
  }

  void moveLeft() {
    x -= moveAmt;
  }

  boolean intersectBar(Bar bar) {
    if (bar.x <= x && bar.x+bar.w >= x && y+r/2.0 <= bar.y && abs((y+r/2.0) - bar.y) <= 4.0) { 
      return true;
    } else {
      return false;
    }
  }

  void draw() {
    noFill();
    ellipse(x, y, r, r);
    fill(0);
    ellipse(x, y, 1, 1);
  }
}