public class tileSquare {
  private float x, y;
  private float size;
  private color c;
 
  public tileSquare(float x_, float y_, int size_, color c_) {
    x = x_;
    y = y_;
    size = size_;
    c = c_;
  }
 
  void display() {
    fill(c);
    rect(x, y, size, size);
  }
}
