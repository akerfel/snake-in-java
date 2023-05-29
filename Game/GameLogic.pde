void updateLogic() {
    background(0);
    // Update game logic
    if (botPlayer) {
        botCommands();
    }
    PL.updatePosition();
    checkIfPlayerCollidesWall();
    removeTurnBlockIfNoSnakeOnIt();
    checkIfPlayerOnFood();
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
