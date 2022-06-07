public class tileLand{ 
  // 2 day array of tileSquares to make up a map
  private tileSquare[][] tiles; 
  
  // displays all individual tiles of the map
  void display(){
    for (int i=0; i<boardlength; i+=1){
      for (int j=0; j<boardlength; j+=1){
        tiles[i][j].display();
      }
    }
  }
  
  // creates a map with given boardlength so it fits proportionally to the set width and height
  public tileLand(int boardlen){
    boardlength = boardlen;
    tiles = new tileSquare[boardlength][boardlength];
    for(int i=0; i<boardlength; i++){
      for(int j=0; j<boardlength; j++){
        // creates the proper number of tileSquares with proper x y and a random color (red or blue)
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
    // creates a temp map for tileSquare
    tileSquare[][] tilesfuture = new tileSquare[boardlength][boardlength];
    for (int i=0; i<boardlength; i+=1){
      for (int j=0; j<boardlength; j+=1){
        // counts the number of red and blue neighbors and also counts itself
        int redn = 0;
        int bluen = 0;
        // counts in a given area size
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
        // generate a random number and compare it to the wildfactor to determine the randomness of tiles changing color
        int chosencolor = (int)random(0,100);
        if (chosencolor >= wildfactor){
          // runs the non-wild code
          // assigns a new color to the tile based on the majority color surrounding it
          if (redn > bluen + (peerinfluencefactor*peerinfluencefactor) && tiles[i][j].c == color(50,50,255)){
            tilesfuture[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(255,50,50));
            red ++;
            blue --;
          }
          else if (bluen > redn + (peerinfluencefactor*peerinfluencefactor) && tiles[i][j].c == color(255,50,50)){
            tilesfuture[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(50,50,255));
            blue ++;
            red --;
          }
          else{
            tilesfuture[i][j] = tiles[i][j];
          }
        }
        else{
          // run the wild code (will assign a random color to that square)
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
    // original array takes new reference to the temp array
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
    // increases radius appropriately (in effect when in time radius mode)
    radius += (directSpeed)/(750*5/(float)(boardlength+2));
    if (!time){
      // if not in time radius mode radius will be influence factor determined
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
          if (radius * (750/(boardlength+2)) >= sqrt( pow(x-((float)j+1.5)*(750)/(boardlength+2),2) + pow(y-((float)(i)+1.5)*(height/(boardlength+2)),2) ) ){
            if (clr.equals("Blue")){
              if (tiles[i][j].c == color(255,50,50) && random(0,3000)>(3000-effect)){
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
