static int boardlength;
static int peerinfluencefactor;
static int directinfluencefactor;
static int wildfactor;
static int directColorMode;
static int directInfluenceMode;
static int timer;
static boolean time;
tileLand tl;
int i= 0;
int j=0;

void setup(){
  size(750,750);
  tl = new tileLand(200,0,1);
//  tl = new tileList(100,1,100);

}

void draw() {
  background(0);
  tl.display();
  fill(255);
  textSize(20);
  text("Board Length: " + boardlength, 20, 30);
  text("Peer Influence: " + peerinfluencefactor, 20, 60);
  text("Wildfactor: " + wildfactor, 20, 90);
  
  if (directColorMode == 1){
    tl.directInfluence(mouseX,mouseY,"Blue",time, directinfluencefactor, (int)timer/10);
  }
  
  else{
    tl.directInfluence(mouseX,mouseY,"Red",time, directinfluencefactor,(int)timer/10);
  }
  println(timer);
  if (!mousePressed || !time){
    timer = 0;
  }
}
  
  void mouseClicked(){
    
  }
  
  void keyPressed(){
  if (key == '1'){
    peerinfluencefactor ++;
  }
  
  if (key == '2' && peerinfluencefactor != 0){
    peerinfluencefactor --;
  }
  
  if (key == '3' && wildfactor != 100){
    wildfactor ++;
  }
  
  if (key == '4' && wildfactor != 0){
    wildfactor --;
  }
  
  if (key == '5'){
    boardlength ++;
  }
  
  if (key == '6' && boardlength > 2){
    boardlength --;
  }
  
  if (key == 'd'){
    directColorMode ++;
    if (directColorMode == 2){
      directColorMode = 0;
    }
  }
  
  if (key == 'g'){
    directInfluenceMode ++;
    if (directInfluenceMode == 2){
      directInfluenceMode = 0;
    }
    time = !time;
  }
  
  if (key == 'f'){
    directinfluencefactor ++;
  }
  
  if (key == 'n'){
    tl.naturalprocess();
  }
}
