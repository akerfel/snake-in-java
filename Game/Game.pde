import java.util.Iterator;

int grid_w;
int grid_h;
int grid_s;
boolean[][] grid;
boolean gameActive;
Player PL;
ArrayList<TurnBlock> activeTurnBlocks;
Food food;
int score;

void setup() {
  size(800, 800);
  background(0, 0, 0);
  grid_w = 30;
  grid_h = 30;
  grid_s = 20;
  grid = new boolean[grid_w][grid_h];
  gameActive = true;
  PL = new Player(4, 4);
  activeTurnBlocks = new ArrayList<TurnBlock>();
  food = new Food();
  score = 0;
  frameRate(10);
}

void draw() {
  if (gameActive) {
    clear();
    // Update game logic
    PL.updatePosition();
    checkIfPlayerCollidesWall();
    removeTurnBlockIfNoSnakeOnIt();
    checkIfPlayerOnFood();
    
    // Draw game elements
    translate((width - grid_s * grid_w)/2, (height - grid_s * grid_h)/2);
    //drawGrid();
    drawWalls();
    food.draw();
    PL.draw();
    drawScore();
  }
  else {
    drawGameOver();
  }
}

void drawWalls() {
  for (int x = 0; x < grid_w; x++) {
    for (int y = 0; y < grid_h; y++) {
      stroke(130, 130, 130);
      if (x == 0 || y == 0 || x == grid_w - 1 || y == grid_h - 1) {
        fill(89, 144, 62);
        rect(x * grid_s, y * grid_s, grid_s, grid_s);
      }
    }
  }
}

void drawScore() {
  fill(color(255, 255, 255));
  textSize(32);
  text("Score: " + score, 0, - 33);
}  

// Draw game over screen
void drawGameOver() {
  fill(color(255, 255, 255));
  textSize(32);
  text("Game over. Press space to restart.", width/5, 35);
}

void checkIfPlayerOnFood() {
  if (PL.hasCoordinates(food.x, food.y)) {
    PL.addTailBlock();  
    food.randomizeLocation();
    score++;
  }
}

void checkIfPlayerCollidesWall() {
  if (PL.x <= 0 || PL.y <= 0 || PL.x >= grid_w - 1 || PL.y >= grid_h - 1) {
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

void removeTurnBlockIfNoSnakeOnIt() {
  Iterator<TurnBlock> iterator = activeTurnBlocks.iterator();
  while (iterator.hasNext()) {
   TurnBlock turnBlock = iterator.next();
   boolean willRemove = true;
   for (TailBlock tailBlock : PL.tailBlocks) {
     if (tailBlock.hasCoordinates(turnBlock.x, turnBlock.y)) {
       willRemove = false;  
     }
   }
   if (willRemove) {
     iterator.remove();  
   }
  }
}

void keyPressed() {
  if (gameActive) {
    if (key == CODED) {
        if (keyCode == DOWN && !PL.directionLastMoved.equals("up")) {
          PL.changeDirection("down");
        }
        if (keyCode == UP && !PL.directionLastMoved.equals("down")) {
          PL.changeDirection("up");
        }
        if (keyCode == RIGHT && !PL.directionLastMoved.equals("left")) {
          PL.changeDirection("right");
        }
        if (keyCode == LEFT && !PL.directionLastMoved.equals("right")) {
          PL.changeDirection("left");
        }
      }
  }
  else if (key == ' ') {
    setup();
  }
}
