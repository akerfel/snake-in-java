void drawEverything() {
    // Draw game elements
    translate((width - grid_s * grid_w)/2, (height - grid_s * grid_h)/2);
    //drawGrid();
    drawWalls();
    food.draw();
    PL.draw();
    drawScore();
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

// Maybe the grid should not be drawn?
void drawGrid() {
    for (int x = 0; x < grid_w; x++) {
        for (int y = 0; y < grid_h; y++) {
            stroke(130, 130, 130);
            if (grid[x][y]) {
                fill(255, 255, 255);
                rect(x * grid_s, y * grid_s, grid_s, grid_s);
            } else {
                fill(0, 0, 0);
                rect(x * grid_s, y * grid_s, grid_s, grid_s);
            }
        }
    }
}
