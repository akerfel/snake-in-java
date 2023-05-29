public class TurnBlock {
    int x;
    int y;
    String direction;

    public TurnBlock(int x, int y, String direction) {
        this.x = x;
        this.y = y;
        this.direction = direction;
    }

    public boolean hasCoordinates(int x, int y) {
        return this.x == x && this.y == y;
    }
}
