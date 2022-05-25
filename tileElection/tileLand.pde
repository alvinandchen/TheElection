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
    tiles = new tileSquare[boardlength][boardlength];
    for(int i=0; i<boardlength; i++){
      for(int j=0; j<boardlength; j++){
        int col = (int)random(1,3);
        if (col == 1){
          tiles[i][j] = new tileSquare((j+1)*width/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(50,50,255));
        }
        else{
          tiles[i][j] = new tileSquare((j+1)*width/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(255,50,50));
        }
      }
    }  
  }
  void naturalprocess(){
    tileSquare[][] tilesfuture = new tileSquare[boardlength][boardlength];
    for (int i=0; i<boardlength; i+=1){
      for (int j=0; j<boardlength; j+=1){
        int red = 0;
        int blue = 0;
        for (int k = -peerinfluencefactor; k <= peerinfluencefactor; k++){
          for (int l = -peerinfluencefactor; l <= peerinfluencefactor; l++){
            if ((i+k>=0 && i+k<boardlength) && (j+l>=0 && j+l<boardlength)){
              if(tiles[i + k][j + l].c == color(255,50,50)){
                red ++;
              }
              if(tiles[i + k][j + l].c == color(50,50,255)){
                blue++;
              }
            }
          } 
        }
        if (red > blue){
          tilesfuture[i][j] = new tileSquare((j+1)*width/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(255,50,50));
        }
        else{
          tilesfuture[i][j] = new tileSquare((j+1)*width/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(50,50,255));
        }
      }
    }
  }
}