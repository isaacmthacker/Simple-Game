import java.util.HashSet;
int w = 800;
int h = 500;
Player player = new Player(w/2.0, 0);

float maxg = 4.0;
float g = 1.0;
float gOffset = 0.1;

boolean canJump = true;
int jumpCnt = 5;
int canJumpNum = 45;

boolean canShoot = true;
int shootCnt = 0;
int canShootNum = 20;


HashSet<Integer> keys = new HashSet<Integer>();

int numBars = 1;
ArrayList<Bar> bars = new ArrayList<Bar>();

ArrayList<Bullet> bullets = new ArrayList<Bullet>();

void setup() {
  background(255);
  size(800, 500);

  bars.add(new Bar(100, 100, 200));
  bars.add(new Bar(200, 200, 100));
  bars.add(new Bar(300, 150, 500));
}

void draw() {
  background(255);
  checkKeys();
  player.draw();
  drawBullets();
  drawBars();





  if (g < maxg) {
    g += gOffset;
  }

  if (player.y <= h-player.r/2.0 && !intersectABar()) {
    player.y += g;
  }

  if (jumpCnt < canJumpNum) {
    ++jumpCnt;
  }
  if (jumpCnt == canJumpNum) {
    canJump = true;
  }

  if (shootCnt < canShootNum) ++shootCnt;
  if (shootCnt == canShootNum) canShoot = true;
}


void keyPressed() {
  //32 == SPACE
  if (keyCode == UP || keyCode == RIGHT || keyCode == LEFT || keyCode == 32) {
    keys.add(keyCode);
  }
}

void keyReleased() {
  if (keyCode == UP || keyCode == RIGHT || keyCode == LEFT || keyCode == 32) {
    keys.remove(keyCode);
  }
}

void checkKeys() {
  if (keys.contains(UP) && canJump) {
    player.y -= 5.0;   //offset to jump after intersect bar
    g = -maxg;
    canJump = false;
    jumpCnt = 0;
  }
  if (keys.contains(RIGHT)) {
    player.moveRight();
    player.movingLeft = false;
  }
  if (keys.contains(LEFT)) {
    player.moveLeft();
    player.movingLeft = true;
  }
  if (keys.contains(32) && canShoot) {
    bullets.add(new Bullet(player.x, player.y, player.movingLeft));
    canShoot = false;
    shootCnt = 0;
  }
}

void drawBars() {
  for (Bar b : bars) {
    b.draw();
  }
}
void drawBullets() {
  for (Bullet b : bullets) {
    b.move();
    b.draw();
  }
}


boolean intersectABar() {
  for (Bar b : bars) {
    if (player.intersectBar(b)) {
      return true;
    }
  }
  return false;
}