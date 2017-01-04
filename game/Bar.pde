class Bar {
  float x;
  float y;
  float w;
  float h = 10;

  Bar(float xx, float yy, float ww) {
    x = xx;
    y = yy;
    w = ww;
  }

  void draw() {
    noFill();
    strokeWeight(2);
    rect(x, y, w, h);    
    strokeWeight(1);
  }
}