// added for count 
static int red;
static int blue;
static int green;
static String out = "";
static String winner = "";
// takes boardlength value
static int boardlength;
static int peerinfluencefactor;
static int wildfactor;
// direct influence code variables
static int directinfluencefactor = 3;
static int directColorMode;
static int directInfluenceMode;
static int directShape;
static int directEffectiveness = 100;
static int directSpeed = 1;
static boolean time;
static float radius;
// time variables for natural process
static int savetime;
static int naturalspeed = 1000;
static int daysleft = 100;
static boolean begin = true;
static boolean end = false;
// tileLand object used as the map
tileLand tl;

void setup(){
  size(1100,750);
  background(0);
}

void beginningscreen(){
  fill(0,0,255);
  textSize(100);
  text("ELECTION", 20, 100);
  fill(250,0,0);
  text("SIMULATOR", 520, 100);    
  textSize(50);
  fill(0,255,0);
  text("CHOOSE YOUR BOARD SIZE", 200, 200);  
  fill(255);
  textSize(30);
  text("Click Anywhere On The Screen To Determine Board Size",155,250);
  textSize(20);
  text("the more left the smaller, the more right the larger (numbers provided for appx reference)",120,280);
  text("15",35,500);
  text("50",140,500);
  text("100",277,500);
  text("150",427,500);
  text("200",575,500);
  text("250",720,500);
  text("300",865,500);
  text("350",1015,500);
  if (mousePressed){
    int size = 5*((((int)(mouseX * ((double)750/1100)))/2)/5);    
    if (size == 0){
      size = 5;
    }
    tl = new tileLand(size);
    begin = false;
  }
}

void draw() {
  if (begin && !end){ 
    background(0);
    beginningscreen();
  }
  
  else if (!begin && !end){
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
    text("Green Count: " + green, 770, down);
    down += 30;
    text("Blue Count: " + blue, 770, down);
    down += 30;
    text("Days Left: " + daysleft, 770, down);
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
    if (directColorMode == 2){
      text("(c) Color of Influence: Green", 770, down);
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
    down += 30;
    text("(-,=) Natural Speed: " + 5/(double)(naturalspeed/100), 770, down);
    
    if (mousePressed){
      tl.directInfluence();
    }
    if (!mousePressed || !time){
      radius = 0;
    }
  
    int passtime = millis() - savetime;
    if (passtime > naturalspeed) {
      if (daysleft > 1){
        if (daysleft == 26){
          tl.rankremove();
        }
        tl.naturalprocess();
        savetime = millis();
        daysleft --; 
      }
      else{
        end = true;
      }
    }
  }
  else{
    endscreen();
  }
}

void endscreen(){
   fill(#34568B);
   rect(0,0,1150,750);
   fill(255);
   textSize(30);
   text("Click To Run Simulation Again",320,650);
   if (mousePressed){
     begin = true;
     end = false;
     reset();
     delay(300);
   }
}
  
void reset(){
  red = 0;
  blue = 0;
  green = 0;
  peerinfluencefactor = 1;
  wildfactor = 1;
  directinfluencefactor = 3;
  directColorMode = 0;
  directInfluenceMode = 0;
  directShape = 0;
  directEffectiveness = 100;
  directSpeed = 1;
  time = false;
  radius = 0;
  savetime = 0;
  naturalspeed = 1000;
  daysleft = 100;
  begin = true;
  end = false;
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
  
  if (key == 'c'){
    directColorMode ++;
    if (directColorMode == 3){
      directColorMode = 0;
    }
  }
  
  if (key == 'r'){
    directInfluenceMode ++;
    if (directInfluenceMode == 2){
      directInfluenceMode = 0;
    }
    time = !time;
  }
  
  if (key == '5'){
    directinfluencefactor ++;
  }
  if (key == '6'){
    directinfluencefactor --;
  }
  if (key == 's'){
    directShape++;
    if (directShape == 2){
      directShape = 0;
    }
  }
  if (key == '7'){
    directEffectiveness ++;
  }
  if (key == '8'){
    directEffectiveness --;
  }
  if (key == '9'){
    directSpeed ++;
  }
  if (key == '0'){
    directSpeed --;
  }
  if (key == '-'){
    if (naturalspeed<2500){
      naturalspeed += 100;
    }
  }
  if (key == '='){
    if (naturalspeed>100){
      naturalspeed -= 100;
    }
  }
}
