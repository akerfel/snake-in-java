import java.util.Iterator;

// In this file, all global variables are declared and initialized,
// and the draw() method is defined, which is called 60 times per second.

int grid_w;
int grid_h;
int grid_s;
boolean[][] grid;
boolean gameActive;
Player PL;
ArrayList<TurnBlock> activeTurnBlocks;
Food food;
int score;
boolean botPlayer = true;

// This method is called at startup
void setup() {
    size(800, 800);
    background(0);
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

// This method is called 60 times per seconds
void draw() {
    if (gameActive) {
        updateLogic();
        drawEverything();
    } else {
        drawGameOver();
    }
}
