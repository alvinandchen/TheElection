static int red;
static int blue;
static int boardlength;
static int peerinfluencefactor;
static int directinfluencefactor = 3;
static int wildfactor;
static int directColorMode;
static int directInfluenceMode;
static int directShape;
static int directEffectiveness = 1000;
static int directSpeed = 1;
static boolean time;
static float radius;
tileLand tl;
int i= 0;
int j=0;

void setup(){
  size(1100,750);
  tl = new tileLand(200);
//  tl = new tileList(100,1,100);

}

void draw() {
  background(0);
  tl.display();
  fill(255);
  textSize(15);
  rect(750,0,1100,750);
  fill(0);
  int down = 30;
  textSize(20);
  text("THE ELECTION", 770, down);  
  down += 30;
  textSize(15);
  text("Map Length: " + boardlength, 770, down);
  down += 30;
  text("Red Count: " + red, 770, down);
  down += 30;
  text("Blue Count: " + blue, 770, down);
  down += 50;
  textSize(20);
  text("NATURAL PROCESS VARIABLES", 770, down);
  down += 30;
  textSize(15);
  text("(1,2) Peer Influence: " + peerinfluencefactor, 770, down);
  down += 30;
  text("(3,4) Wild Factor: " + wildfactor, 770, down);
  down += 50;
  textSize(20);
  text("ARTIFICAL PROCESS VARIABLES", 770, down);  
  down += 30;
  textSize(15);
  if (directColorMode == 0){
    text("(c) Color of Influence: Red", 770, down);
  }
  if (directColorMode == 1){
    text("(c) Color of Influence: Blue", 770, down);
  }
  down += 30;
  if (directShape == 0){
    text("(s) Shape of Influence: Circle", 770, down);
  }
  else{
    text("(s) Shape of Influence: Square", 770, down);
  }
  down += 30;
  if (time){
    text("(r) Radius Mode: TIME", 770, down);
  }
  else{
    text("(r) Radius Mode: SET", 770, down);
  }  
  down += 30;
  text("(5,6) Radius of Influence (set): " + directinfluencefactor, 770, down);
  down += 30;
  text("(auto) Radius of Influence (time): " + (int) radius, 770, down);
  down += 30;
  text("(7,8) Effectiveness of Influence: " + directEffectiveness, 770, down);
  down += 30;
  text("(9,0) Speed of Influence: " + directSpeed, 770, down);
  
  if (mousePressed){
    if (directColorMode == 1){
      tl.directInfluence(mouseX,mouseY,"Blue",time, directinfluencefactor, directShape, directEffectiveness);
    }
    
    else{
      tl.directInfluence(mouseX,mouseY,"Red",time, directinfluencefactor, directShape, directEffectiveness);
    }
  }
  if (!mousePressed || !time){
    radius = 0;
  }
}
  
 void keyPressed(){

}
