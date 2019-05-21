public class Food {
  int x;
  int y;
  
  public Food() {
    randomizeLocation();
  }
  
  void randomizeLocation() {
    x = int(random(0, grid_w));
    y = int(random(0, grid_h));
  }
  
  public void draw() {
    fill(255, 0, 0);
    ellipseMode(CORNER);
    circle(x * grid_s, y * grid_s, grid_s);  
  }
}
