public class Player {
  int x;
  int y;
  String direction;
  
  public Player(int startX, int startY) {
    x = startX;
    y = startY;
    direction = "down";
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
}
