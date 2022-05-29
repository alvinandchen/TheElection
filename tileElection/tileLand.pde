public class tileLand{ 
  private tileSquare[][] tiles; 
  
  void display(){
    for (int i=0; i<boardlength; i+=1){
      for (int j=0; j<boardlength; j+=1){
        tiles[i][j].display();
      }
    }
  }
  
  public tileLand(int boardlen){
    boardlength = boardlen;
    tiles = new tileSquare[boardlength][boardlength];
    for(int i=0; i<boardlength; i++){
      for(int j=0; j<boardlength; j++){
        int col = (int)random(1,3);
        if (col == 1){
          tiles[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(50,50,255));
          blue += 1;
        }
        else{
          tiles[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(255,50,50));
          red += 1;
        }
      }
    }  
  }
  void naturalprocess(){
    tileSquare[][] tilesfuture = new tileSquare[boardlength][boardlength];
    for (int i=0; i<boardlength; i+=1){
      for (int j=0; j<boardlength; j+=1){
        int redn = 0;
        int bluen = 0;
        for (int k = -peerinfluencefactor; k <= peerinfluencefactor; k++){
          for (int l = -peerinfluencefactor; l <= peerinfluencefactor; l++){
            if ((i+k>=0 && i+k<boardlength) && (j+l>=0 && j+l<boardlength)){
              if(tiles[i + k][j + l].c == color(255,50,50)){
                redn ++;
              }
              if(tiles[i + k][j + l].c == color(50,50,255)){
                bluen++;
              }
            }
          } 
        }
        int chosencolor = (int)random(0,100);
        if (chosencolor >= wildfactor){
          if (redn > bluen && tiles[i][j].c == color(50,50,255)){
            tilesfuture[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(255,50,50));
            red ++;
            blue --;
          }
          else if (bluen > redn && tiles[i][j].c == color(255,50,50)){
            tilesfuture[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(50,50,255));
            blue ++;
            red --;
          }
          else{
            tilesfuture[i][j] = tiles[i][j];
          }
        }
        else{
          int redorblue = (int)random(1,3);
          if (redorblue == 1 && tiles[i][j].c == color(255,50,50)){
              tilesfuture[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(50,50,255));
              blue ++;
              red --;
          }
          else if (redorblue == 2 && tiles[i][j].c == color(50,50,255)){
              tilesfuture[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(255,50,50));
              red ++;
              blue --;
          }
          else {
              tilesfuture[i][j] = tiles[i][j];
          }
        }
      }
    }
    tiles = tilesfuture;
  }
  void directInfluence(float x, float y, String clr, boolean time, int influencefactor, int shape, int effect){
    //check if square or circle influence area chosen
    boolean square = false;
    boolean circle = false;
    if (shape == 1){
      square = true;
    }
    else{
      circle = true;
    }
    radius += (directSpeed)/(750*5/(float)(boardlength+2));
    if (!time){
      radius = influencefactor;
    }
    
    //loop through all pieces on board
    for (int i = 0; i < boardlength; i++){
      for (int j = 0; j < boardlength; j++){
    
        // square influence code
        if (square){
          if ((j+1)*(width-350)/(boardlength+2)<x && (j+2)*(width-350)/(boardlength+2)>x && (i+1)*height/(boardlength+2)<y&& (i+2)*height/(boardlength+2)>y){
            for (int k = -((int)radius); k <= ((int)radius); k++){
              for (int l = -((int)radius); l <= ((int)radius); l++){
                if ((i+k>=0 && i+k<boardlength) && (j+l>=0 && j+l<boardlength)){     
                  if (clr.equals("Blue")){
                    if (tiles[i+k][j+l].c == color(255,50,50)&& random(0,3000)>(3000-effect)){
                      println(i);
                      tiles[i+k][j+l] = new tileSquare((j+l+1)*(width-350)/(boardlength+2),(i+k+1)*height/(boardlength+2),height/(boardlength+2),color(50,50,255));            
                      blue ++;
                      red --;
                    }
                  }
                  if (clr.equals("Red")){
                    if (tiles[i+k][j+l].c == color(50,50,255) && random(0,3000)>(3000-effect)){
                      tiles[i+k][j+l] = new tileSquare((j+l+1)*(width-350)/(boardlength+2),(i+k+1)*height/(boardlength+2),height/(boardlength+2),color(255,50,50));                
                      red ++;
                      blue --;
                    }
                  }
                }
              }
            }
          }
        }
        
        // circle influence code
        if (circle){
          if (radius * (750/(boardlength+2)) >= sqrt( pow(x-((float)j+1.5)*(750)/(boardlength+2),2) + pow(y-((float)(i*5/4)+1.5)*(height/(boardlength+2)),2) ) ){
            if (clr.equals("Blue")){
              if (tiles[i][j].c == color(255,50,50) && random(0,3000)>(3000-effect)){
                println(i);
                tiles[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*(height)/(boardlength+2),height/(boardlength+2),color(50,50,255));            
                red --;
                blue ++;
              }
            }
            if (clr.equals("Red")){
              if (tiles[i][j].c == color(50,50,255) && random(0,3000)>(3000-effect)){
                tiles[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(255,50,50));
                blue --;
                red ++;
              }
            }
          }
        }
        
      }
    }
  }
}
