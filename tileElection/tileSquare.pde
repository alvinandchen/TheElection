public class tileSquare {
  private float x, y;
  private float size;
  private color c;
  private color lastcolor;
 //constructor for tileSquare object
  public tileSquare(float x_, float y_, int size_, color c_, color lastcolor_) {
    x = x_;
    y = y_;
    size = size_;
    c = c_;
    lastcolor = lastcolor_;
  }
 //display cell
  void display() {
    fill(c);
    rect(x, y, size, size);
  }
}
