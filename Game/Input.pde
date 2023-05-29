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
    } else if (key == ' ') {
        setup();
    }
}

void botCommands() {
    int xFoodDiff = food.x - PL.x;
    int yFoodDiff = food.y - PL.y;

    if (xFoodDiff > 0) {
        PL.changeDirection("right");
    } else if (xFoodDiff < 0) {
        PL.changeDirection("left");
    }
    if (yFoodDiff > 0) {
        PL.changeDirection("down");
    } else if (yFoodDiff < 0) {
        PL.changeDirection("up");
    }
}
