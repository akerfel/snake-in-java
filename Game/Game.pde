int grid_w;
int grid_h;
int grid_s;
boolean[][] grid;

Player PL;

void setup() {
  size(600, 800);
  background(0, 0, 0);
  grid_w = 10;
  grid_h = 10;
  grid_s = 50;
  grid = new boolean[grid_w][grid_h];
  
  PL = new Player(4, 4);
}

void draw() {
  drawGrid();
  
  // Delay until next game update
  delay(100);
}

void drawGrid() {
  for (int x = 0; x < grid_w; x++) {
    for (int y = 0; y < grid_h; y++) {
      stroke(130, 130, 130);
      if (grid[x][y]) {
        fill(255, 255, 255);
        rect(x * grid_s, y * grid_s, grid_s, grid_s);
      }
      else {
        fill(0, 0, 0);
        rect(x * grid_s, y * grid_s, grid_s, grid_s);
      }
    }
  }
  
  fill(255, 255, 255);
  rect(PL.x * grid_s, PL.y * grid_s, grid_s, grid_s);
}

void keyPressed() {
  if (key == CODED) {
      if (keyCode == DOWN) {
        PL.y++;
      }
      if (keyCode == UP) {
        PL.y--;
      }
      if (keyCode == RIGHT) {
        PL.x++;
      }
      if (keyCode == LEFT) {
        PL.x--;
      }
    }
}
