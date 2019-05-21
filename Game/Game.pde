int grid_w;
int grid_h;
int grid_s;
boolean[][] grid;
boolean gameActive;
Player PL;
ArrayList<TurnBlock> activeTurnBlocks;

void setup() {
  size(1200, 1200);
  background(0, 0, 0);
  grid_w = 30;
  grid_h = 30;
  grid_s = 20;
  grid = new boolean[grid_w][grid_h];
  gameActive = true;
  PL = new Player(4, 4);
  activeTurnBlocks = new ArrayList<TurnBlock>();
}

void draw() {
  
  if (gameActive) {
    // Update game logic
    PL.updatePosition();
    checkIfPlayerDies();
    
    // Draw game elements
    translate((width - grid_s * grid_w)/2, (height - grid_s * grid_h)/2);
    drawGrid();
    PL.draw();
    
    // Delay until next game update
    delay(100);
  }
  if (!gameActive) {
    drawGameOver();
  }
}

// Draw game over screen
void drawGameOver() {
  fill(color(255, 255, 255));
  textSize(32);
  text("Game over", width/2, height/2);
}

void checkIfPlayerDies() {
  if (PL.x < 0 || PL.y < 0 || PL.x > grid_w - 1 || PL.y > grid_h - 1) {
     gameActive = false;
  }
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
  
  
}

void keyPressed() {
  if (key == CODED) {
      if (keyCode == DOWN && !PL.direction.equals("up")) {
        PL.changeDirection("down");
      }
      if (keyCode == UP && !PL.direction.equals("down")) {
        PL.changeDirection("up");
      }
      if (keyCode == RIGHT && !PL.direction.equals("left")) {
        PL.changeDirection("right");
      }
      if (keyCode == LEFT && !PL.direction.equals("right")) {
        PL.changeDirection("left");
      }
    }
  else if (key == ' ') {
    PL.addTailBlock();
  }
}
