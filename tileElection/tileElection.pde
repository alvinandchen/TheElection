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
}
