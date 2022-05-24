public class tileLand{ 
  private tileSquare[][] tiles; 
  
  void display(){
    for (int i=0; i<boardlength; i+=1){
      for (int j=0; j<boardlength; j+=1){
        tiles[i][j].display();
        //println(tiles[i][j].c==color(50,50,255));
      }
    }
  }
  
  public tileLand(int boardlen, int pinfluencef, int wildf){
    wildfactor = wildf;
    peerinfluencefactor = pinfluencef;
    boardlength = boardlen;
  
  }
  
}
