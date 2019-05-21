public class Player {
  int x;
  int y;
  String direction;
  ArrayList<TailBlock> tailBlocks;
  boolean justAddedTailBlock;
  
  public Player(int x, int y) {
    this.x = x;
    this.y = y;
    direction = "down";
    tailBlocks = new ArrayList<TailBlock>();
    justAddedTailBlock = false;
  }

  public void updatePosition() {
    switch (direction) {
      case "down": 
        y++;
        break;
      case "up": 
        y--;
        break;
      case "right": 
        x++;
        break;
      case "left": 
        x--;
        break;
    }
    
    for (TailBlock tailBlock : tailBlocks) {
      for (TurnBlock turnBlock : activeTurnBlocks) {
        if (tailBlock.hasCoordinates(turnBlock.x, turnBlock.y)) {
          tailBlock.direction = turnBlock.direction;
        }
      }
    }
    
    updateTailBlocksPosition();
  }
  
  public void changeDirection(String newDirection) {
    direction = newDirection;
    activeTurnBlocks.add(new TurnBlock(x, y, direction));
  }
  
  public void updateTailBlocksPosition() {
    if (justAddedTailBlock) {
      justAddedTailBlock = false;  
    }
    else {
      for (TailBlock tailBlock : tailBlocks) {
        tailBlock.updatePosition();
      }
    }
  }
  
  public void addTailBlock() {
    switch (direction) {
      case "down": 
        tailBlocks.add(0, new TailBlock(x, y - 1, direction));
        break;
      case "up": 
        tailBlocks.add(0, new TailBlock(x, y + 1, direction));
        break;
      case "right": 
        tailBlocks.add(0, new TailBlock(x - 1, y, direction));
        break;
      case "left": 
        tailBlocks.add(0, new TailBlock(x + 1, y, direction));
        break;
    }
    if (tailBlocks.size() != 1) {
      justAddedTailBlock = true;
    }
  }
  
  public void draw() {
    fill(255, 255, 255);
    rect(x * grid_s, y * grid_s, grid_s, grid_s);  
    for (TailBlock tailBlock : tailBlocks) {
      tailBlock.draw();
    }
  }
}
