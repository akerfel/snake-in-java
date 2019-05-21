public class TailBlock {
  int x;
  int y;
  String direction;
  
  public TailBlock(int startX, int startY, String direction) {
    this.x = startX;
    this.y = startY;
    this.direction = direction;
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
  }
  
  public boolean hasCoordinates(int x, int y) {
    return this.x == x && this.y == y;  
  }
  
  public void draw() {
    fill(255, 255, 255);
    rect(x * grid_s, y * grid_s, grid_s, grid_s);  
  }
}
