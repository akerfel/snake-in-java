int grid_w;
int grid_h;
int grid_s;
boolean[][] grid;

Player PL;

void setup() {
  size(1200, 1200);
  background(0, 0, 0);
  grid_w = 30;
  grid_h = 30;
  grid_s = 20;
  grid = new boolean[grid_w][grid_h];
  
  PL = new Player(4, 4);
}

void draw() {
  // Update game logic
  PL.updatePosition();
  
  // Draw game elements
  drawGrid();
  
  // Delay until next game update
  delay(100);
}

// Maybe the grid should not be drawn?
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
      if (keyCode == DOWN && !PL.direction.equals("up")) {
        PL.direction = "down";
      }
      if (keyCode == UP && !PL.direction.equals("down")) {
        PL.direction = "up";
      }
      if (keyCode == RIGHT && !PL.direction.equals("left")) {
        PL.direction = "right";
      }
      if (keyCode == LEFT && !PL.direction.equals("right")) {
        PL.direction = "left";
      }
    }
}
