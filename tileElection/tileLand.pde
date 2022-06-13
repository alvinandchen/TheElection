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
        int col = (int)random(1,4);
        if (col == 1){
          tiles[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(50,50,255),color(50,50,255));
          blue += 1;
        }
        else if (col == 2){
          tiles[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(50,255,50),color(50,255,50));
          green += 1;
        }
        else{
          tiles[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(255,50,50),color(255,50,50));
          red += 1;
        }
      }
    }  
  }
  //umbrella method for natural process
  void naturalprocess(){
    // creates a temp map for tileSquare
    tileSquare[][] tilesfuture = new tileSquare[boardlength][boardlength];
    for (int i=0; i<boardlength; i+=1){
      for (int j=0; j<boardlength; j+=1){
        // counts the number of red and blue neighbors and also counts itself
        int redn = 0;
        int greenn = 0;
        int bluen = 0;
        if (tiles[i][j].c == color(255,50,50)){
          redn +=2;
        }
        if (tiles[i][j].c == color(50,255,50)){
          greenn += 2;
        }
        if (tiles[i][j].c == color(50,50,255)){
          bluen +=2;
        }
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
              if(tiles[i + k][j + l].c == color(50,255,50)){
                greenn++;
              }
            }
          } 
        }
        // generate a random number and compare it to the wildfactor to determine the randomness of tiles changing color
        int chosencolor = (int)random(0,100);
        double balancingfactor;
        if (peerinfluencefactor <= 10){
          balancingfactor = 1.5 - (peerinfluencefactor*0.05);
        }
        else{
          balancingfactor = 1;
        }
        if (chosencolor >= wildfactor){
          // runs the non-wild code
          // assigns a new color to the tile based on the majority color surrounding it
          if (redn > bluen*balancingfactor && redn > greenn*balancingfactor && tiles[i][j].c != color(255,50,50)){
            tilesfuture[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(255,50,50),tiles[i][j].c);
            red ++;
            if (tiles[i][j].c == color(50,255,50)){
              green --;
            }
            if (tiles[i][j].c == color(50,50,255)){
              blue --;
            }
          }
          else if (bluen > redn*balancingfactor && bluen > greenn*balancingfactor && tiles[i][j].c != color(50,50,255)){
            tilesfuture[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(50,50,255),tiles[i][j].c);
            blue ++;
            if (tiles[i][j].c == color(50,255,50)){
              green --;
            }
            if (tiles[i][j].c == color(255,50,50)){
              red --;
            }
          }
          else if (greenn > redn*balancingfactor && greenn > bluen*balancingfactor && tiles[i][j].c != color(50,255,50)){
            tilesfuture[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(50,255,50),tiles[i][j].c);
            green ++;
            if (tiles[i][j].c == color(255,50,50)){
              red --;
            }
            if (tiles[i][j].c == color(50,50,255)){
              blue --;
            }
          }
          else{
            tilesfuture[i][j] = tiles[i][j];
          }
        }
        else{
          // run the wild code (will assign a random color to that square)
          int rgb = (int)random(1,4);
          if (rgb == 1 && tiles[i][j].c != color(50,50,255) && !out.equals("blue")){
              tilesfuture[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(50,50,255),tiles[i][j].c);
              blue ++;
              if (tiles[i][j].c == color(50,255,50)){
                green --;
              }
              if (tiles[i][j].c == color(255,50,50)){
                red --;
              }
          }
          else if (rgb == 2 && tiles[i][j].c != color(255,50,50) && !out.equals("red")){
              tilesfuture[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(255,50,50),tiles[i][j].c);
              red ++;
              if (tiles[i][j].c == color(50,255,50)){
                green --;
              }
              if (tiles[i][j].c == color(50,50,255)){
                blue --;
              }
          }
          else if (rgb == 3 && tiles[i][j].c != color(50,255,50) && !out.equals("green")){
              tilesfuture[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(50,255,50),tiles[i][j].c);
              green ++;
              if (tiles[i][j].c == color(255,50,50)){
                red --;
              }
              if (tiles[i][j].c == color(50,50,255)){
                blue --;
              }
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
  //method for direct influence by user
  void directInfluence(){
    String clr;
    if (directColorMode == 0){
      clr = "Red";
    }
    else if (directColorMode == 1){
      clr = "Blue";
    }    
    else{
      clr = "Green";
    }
    //check if square or circle influence area chosen
    boolean square = false;
    boolean circle = false;
    if (directShape == 1){
      square = true;
    }
    else{
      circle = true;
    }
    // increases radius appropriately (in effect when in time radius mode)
    radius += (directSpeed)/(750*5/(float)(boardlength+2));
    if (!time){
      // if not in time radius mode radius will be influence factor determined
      radius = directinfluencefactor;
    }
    
    //loop through all pieces on board
    for (int i = 0; i < boardlength; i++){
      for (int j = 0; j < boardlength; j++){
    
        // square influence code
        if (square){
          squareinfluence(i,j,clr);
        }
        // circle influence code
        if (circle){
          circleinfluence(i,j,clr);
        }
      }
    }
  }
  //method for square influence (factors effectiveness)
  void squareinfluence(int i, int j, String clr){
    if ((j+1)*(width-350)/(boardlength+2)<mouseX && (j+2)*(width-350)/(boardlength+2)>mouseX && (i+1)*height/(boardlength+2)<mouseY&& (i+2)*height/(boardlength+2)>mouseY){
      for (int k = -((int)radius); k <= ((int)radius); k++){
        for (int l = -((int)radius); l <= ((int)radius); l++){
          if ((i+k>=0 && i+k<boardlength) && (j+l>=0 && j+l<boardlength)){     
            if (clr.equals("Blue")){
              if (tiles[i+k][j+l].c != color(50,50,255)&& random(0,3000)>(3000-directEffectiveness)){
                adding("blue",i+k,j+l);
                tiles[i+k][j+l] = new tileSquare((j+l+1)*(width-350)/(boardlength+2),(i+k+1)*height/(boardlength+2),height/(boardlength+2),color(50,50,255),tiles[i+k][j+l].c);            
                
              }
            }
            if (clr.equals("Red")){
              if (tiles[i+k][j+l].c != color(255,50,50) && random(0,3000)>(3000-directEffectiveness)){
                adding("red",i+k,j+l);
                tiles[i+k][j+l] = new tileSquare((j+l+1)*(width-350)/(boardlength+2),(i+k+1)*height/(boardlength+2),height/(boardlength+2),color(255,50,50),tiles[i+k][j+l].c);                
                
              }
            }
            if (clr.equals("Green")){
              if (tiles[i+k][j+l].c != color(50,255,50) && random(0,3000)>(3000-directEffectiveness)){
                adding("green",i+k,j+l);
                tiles[i+k][j+l] = new tileSquare((j+l+1)*(width-350)/(boardlength+2),(i+k+1)*height/(boardlength+2),height/(boardlength+2),color(50,255,50),tiles[i+k][j+l].c);                
                
              }
            }
          }
        }
      }
    }
  }
  //method for circle influence (factors effectiveness)
  void circleinfluence(int i, int j, String clr){
    if (radius * (750/(boardlength+2)) >= sqrt( pow(mouseX-((float)j+1.5)*((float)750)/(boardlength+2),2) + pow(mouseY-((float)(i)+1.5)*(((float)750)/(boardlength+2)),2) ) ){
      if (clr.equals("Blue")){
        if (tiles[i][j].c != color(50,50,255) && random(0,3000)>(3000-directEffectiveness)){
          adding("blue",i,j);
          tiles[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*(height)/(boardlength+2),height/(boardlength+2),color(50,50,255),tiles[i][j].c);            
        }
      }
      if (clr.equals("Red")){
        if (tiles[i][j].c != color(255,50,50) && random(0,3000)>(3000-directEffectiveness)){
          adding("red",i,j);
          tiles[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(255,50,50),tiles[i][j].c);
        }
      }
      if (clr.equals("Green")){
        if (tiles[i][j].c != color(50,255,50) && random(0,3000)>(3000-directEffectiveness)){
          adding("green",i,j);
          tiles[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(50,255,50),tiles[i][j].c);
        }
      }
    }
  }
  //determining color count
  void adding(String col, int i, int j){
    if (col.equals("green")){
      if (tiles[i][j].c == color(255,50,50)){
        red --;
      }
      if (tiles[i][j].c == color(50,50,255)){
        blue --;
      }
      green ++;
    }
    if (col.equals("red")){
      if (tiles[i][j].c == color(50,255,50)){
        green --;
      }
      if (tiles[i][j].c == color(50,50,255)){
        blue --;
      }
      red ++;
    }
    if (col.equals("blue")){
      if (tiles[i][j].c == color(255,50,50)){
        red --;
      }
      if (tiles[i][j].c == color(50,255,50)){
        green --;
      }     
      blue ++;
    }
  }
  //method to determine which color to remove
  void rankremove(){
    if (green <= red && green <= blue){
      out = "green";
      for (int i=0; i<boardlength; i+=1){
        for (int j=0; j<boardlength; j+=1){
          if (tiles[i][j].c == color(50,255,50)){
            green --;
            if (tiles[i][j].lastcolor != color(50,255,50)){
              tiles[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),tiles[i][j].lastcolor,tiles[i][j].lastcolor);            
            }
            else{
              int col = (int)random(1,3);
              if (col == 1){
                tiles[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(255,50,50),color(255,50,50));
                red += 1;
              }
              else if (col == 2){
                tiles[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(50,50,255),color(50,50,255));
                blue += 1;
              }              
            }
          }
        }
      }
    }
    else if (blue <= red && blue <= green){
      out = "blue";
      for (int i=0; i<boardlength; i+=1){
        for (int j=0; j<boardlength; j+=1){
          if (tiles[i][j].c == color(50,50,255)){
            blue --;
            if (tiles[i][j].lastcolor != color(50,50,255)){
              tiles[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),tiles[i][j].lastcolor,tiles[i][j].lastcolor);            
            }
            else{
              int col = (int)random(1,3);
              if (col == 1){
                tiles[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(255,50,50),color(255,50,50));
                red += 1;
              }
              else if (col == 2){
                tiles[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(50,255,50),color(50,255,50));
                green += 1;
              }              
            }
          }        
        }
      }    
    }
    else if (red <= green && red <= blue){
      out = "red";
      for (int i=0; i<boardlength; i+=1){
        for (int j=0; j<boardlength; j+=1){
          if (tiles[i][j].c == color(255,50,50)){
            red --;
            if (tiles[i][j].lastcolor != color(255,50,50)){
              tiles[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),tiles[i][j].lastcolor,tiles[i][j].lastcolor);            
            }
            else{
              int col = (int)random(1,3);
              if (col == 1){
                tiles[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(50,50,255),color(50,50,255));
                blue += 1;
              }
              else if (col == 2){
                tiles[i][j] = new tileSquare((j+1)*(width-350)/(boardlength+2),(i+1)*height/(boardlength+2),height/(boardlength+2),color(50,255,50),color(50,255,50));
                green += 1;
              }              
            }
          }        
        }
      }    
    }
  }
  //method to count districts
  void countdistrict(int districtsize){
    for (int i = 0; i < districtsize; i++){
      for (int j = 0; j < districtsize; j++){
        int redn = 0;
        int bluen = 0;
        int greenn = 0;
        int tilex = 2 + 3*i;
        int tiley = 2 + 3*j;
        for (int k = -2; k <= 2; k++){
          for (int l = -2; l <= 2; l++){
            if ((i+k>=0 && i+k<boardlength) && (j+l>=0 && j+l<boardlength)){
              if(tiles[tilex + k][tiley + l].c == color(255,50,50)){
                redn ++;
              }
              if(tiles[tilex + k][tiley + l].c == color(50,50,255)){
                bluen++;
              }
              if(tiles[tilex + k][tiley + l].c == color(50,255,50)){
                greenn++;
              }
            }
          } 
        }
        if (greenn >= redn && greenn >= bluen){
          greendis ++;
        }
        if (redn >= greenn && redn >= bluen){
          reddis ++;
        }
        if (bluen >= redn && bluen >= greenn){
          bluedis ++;
        } 
      }
    }
  }

}
