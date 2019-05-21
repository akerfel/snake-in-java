public class Food {
  int x;
  int y;
  
  public Food() {
    randomizeLocation();
  }
  
  void randomizeLocation() {
    x = int(random(1, grid_w - 1));
    y = int(random(1, grid_h - 1));
  }
  
  public void draw() {
    fill(255, 0, 0);
    ellipseMode(CORNER);
    circle(x * grid_s, y * grid_s, grid_s);  
  }
}
