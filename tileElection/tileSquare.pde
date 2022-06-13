public class tileSquare {
  private float x, y;
  private float size;
  private color c;
  private color lastcolor;
 
  public tileSquare(float x_, float y_, int size_, color c_, color lastcolor_) {
    x = x_;
    y = y_;
    size = size_;
    c = c_;
    lastcolor = lastcolor_;
  }
 
  void display() {
    fill(c);
    rect(x, y, size, size);
  }
}
