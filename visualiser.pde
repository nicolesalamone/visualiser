//NICOLE SALAMONE FINAL PROJECT
//Instances of code taken and manipulated from following sources:
//Beat Detect analysis by Minim: http://code.compartmental.net/minim
//Learning Processing by Daniel Shiffman // Example 13-7: Wave // http://www.learningprocessing.com
//Processing Example: Space Junk -  by Ira Greenberg (zoom suggestion by Danny Greenberg).
//Processing Example: Triangle Strip - by Ira Greenberg. 
//Processing Example: Cubes Contained Within a Cube - by Ira Greenberg.  

//importing mimim and minim analysis libraries
import ddf.minim.*;
import ddf.minim.analysis.*;

//minim classes
Minim minim;
AudioPlayer player_1;
BeatDetect beat;
BeatListener bl;

//listing button objects
//buttons Set 0
Button button1;
Button button2;
Button button3;
Button button4;
Button button5;
Button button6;
Button button7;
Button button8;
Button button9;
//buttons set 1
Button button10;
Button button11;
Button button12;
Button button13;
Button button14;
Button button15;
Button button16;
Button button17;
Button button18;
//buttons set 2
Button button19;
Button button20;
Button button21;
Button button22;
Button button23;
Button button24;
Button button25;
Button button26;
Button button27;
//buttons set 3
Button button28;
Button button29;
Button button30;
Button button31;
Button button32;
Button button33;
Button button34;
Button button35;
Button button36;

//variables for buttons
//sets
int setZero=8;
int setOne=8;
int setTwo=8;
int setThree=8;
//x and y coordinates according to w & h
float screenWIncr;
float screenHIncr;

//other variables
float kickSize, snareSize, hatSize;
float hu=359;
float increment=1;
float center=0;
int count=0;
int counta=0;
int countb=0;
int countc=0;
int countd=0;
int counte=0;
int countf=0;
float theta = 0.0;
float rot=1;
float plus=1;
float moveX=1;
float moveY=10;
float centerX=0;
float centerY=0;
float counter;
float scale=20;
float scaleA=0;
float scaleB=25;
float scaleC=50;
//for SnareA
float angle;
int limit = 50;
Cube[] cubes = new Cube[limit];
//for SnareB
int x;
int y;
float outsideRadius = 400;
float insideRadius = 440;
//FOR HatA
CubeA[] cubies = new CubeA[20]; 
// Size of outer cube
float bounds = 500;
//for kickF
CubeKick[] coobies = new CubeKick[20]; 

//image and media variables
PImage face;
PImage[] imgList;
PImage obama, mouth;
PImage fetus, fetustwo;
PImage[] imgListA;
PImage beachball;
PImage emoji;
PImage marriage;
PImage[] imgListB; 
PImage mac;
PImage youtube;
PImage car;
PImage front;
PImage back;
PImage[] imgListC;
PImage bbA;
PImage bbB;
PImage titleA;
PImage titleB;
PImage titleC;
PImage titleD;
PImage finger;
PImage[] imgListD;
PImage aesthetic;
PImage[]imgListE;

PFont font;

//minim beat detect -- beat listener
//detecting beats from the AudioPlayer
class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;
  
  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
  
  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }
  
  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}


void setup(){
 // size(480, 270, P3D);
size(960, 540, P3D);
//size(1920, 1080, P3D);
 colorMode(HSB, 360, 100, 100);
 rectMode(CORNER);
 background(360,0,100);
 noStroke();
 smooth();

  //MINIM STUFF
  //loading song(file.mp3, buffersize), playing song, looping song
  minim = new Minim(this); 
  player_1 = minim.loadFile("TheBay.mp3", 1024);
  player_1.play();
  player_1.loop();
  //a beat is visually implemented based on the buffer size and the sample rate of the song file
  beat = new BeatDetect(player_1.bufferSize(), player_1.sampleRate());
  //controlling how long beat detect will wait to implement a beat, larger number = implements beats more frequently
  beat.setSensitivity(50);    
  bl = new BeatListener(beat, player_1); 

  //CONDITIONALS FOR MUSIC VISUALIZATION FUNCTIONS 
  //for Snare A
  //constructor setting the (random)x,y,z positions of the SnareA() cubes
  //cubes can only be within a certain bounds, if they're out of bounds, they'll go backwards  
    for (int i = 0; i < cubes.length; i++){
    cubes[i] = new Cube(int(random(-10, 10)), int(random(-10, 10)), 
                        int(random(-10, 10)), int(random(-140, 140)), 
                        int(random(-140, 140)), int(random(-140, 140)));
  }
  //for Snare B
    x = width/2;
    y = height/2;    
  //FOR Hat A
    //controls x,y,z position of cubes, they can only be within a certain boundary 
    //if outside the boundary, go back inside
    for (int i = 0; i < cubies.length; i++) {
    // Cubies are randomly sized
    float cubieSize = random(25, 55);
    cubies[i] =  new CubeA(cubieSize, cubieSize, cubieSize);
  }
    //This conditional is doing the same as above, just for KickF
    for (int k = 0; k < coobies.length; k++) {
    float cubieSize = random(25, 55);
    coobies[k] =  new CubeKick(cubieSize, cubieSize, cubieSize);
  }
  
  //LOADING IMAGES AND IMAGE ARRAYS BELOW
    
  //crying emoji face
   face = loadImage("face1.png");
   
  //wave background
    imgList = new PImage[5]; 
    for (int i=0;i<5;i++) {
    imgList[i]=loadImage("pool00"+i+".png");    
    }
    
    //obama mouth
    obama = loadImage("obama2.jpg");
    mouth = loadImage("obama.jpg");   
    
    //fetus pictures
     fetus = loadImage("fetus.jpg");
     fetustwo = loadImage("fetus2.jpg");    
    
   //beachball of death
     beachball = loadImage("beachball.png"); 
    
    //moody background
    imgListA = new PImage[10]; 
    for (int a=0;a<10;a++) {
    imgListA[a]=loadImage("moody00"+a+".png");
    }
  
    //perspective grid snare thing
    imgListB = new PImage[8];
    for (int b=0; b<8; b++) {
    imgListB[b]=loadImage("grid00"+b+".png");
    }
    
   //running horse
    imgListC = new PImage[10];
    for(int c=0;c<10;c++){
    imgListC[c]=loadImage("horse00"+c+".png");
    }
  
  //scared face emoji  
  emoji=loadImage("emoji2.png");
  counter=0.0;
  
  //marriage emoji
  marriage = loadImage("marriage.gif");
  
  //mac stary background
  mac = loadImage("starbg.jpeg");
  
  //youtube background
  youtube = loadImage("youtube.png");
  
  //car kick thing
  car = loadImage("fullcar.jpg");
  front = loadImage("frontwheel.png");
  back = loadImage("backwheel.png");
  
  //dancing baby girl in winter coat
  bbA = loadImage("bbgirl1.png");
  bbB = loadImage("bbgirl2.png");
  
  //finger dance
  finger = loadImage("finger.png");
  
  //liquid image gif thing
    imgListD = new PImage[10];
    for(int d=0;d<10;d++){
    imgListD[d]=loadImage("liquid00"+d+".png");
    }
  
  //dancing baby
    imgListE = new PImage[10];
    for(int e=0;e<10;e++){
    imgListE[e]=loadImage("baby00"+e+".png");
    }
    
  //do it for the aesthetic
  aesthetic = loadImage("aesthetic.png");
 
  //button title images
  titleA = loadImage("title1-01.png");
  titleB = loadImage("title2-01.png");
  titleC = loadImage("title3-01.png");
  titleD = loadImage("title4-01.png");
  
  //makes align center x and y
  textAlign(CENTER, CENTER);
  font = createFont("Helvetica-Bold", 400);

  //spaces between buttons
  screenWIncr=width/44;
  screenHIncr=height/25;
  
//  Button(int tempX, int tempY, color tempBClr, color tempOvrClr, int tempSetNo, int tempButtonNo, boolean tempHover)
//BACKGROUND SET 0
  button1 = new Button(screenWIncr*41, screenHIncr*2, color(100,0, 100), color(70,100,100),0, 0, false);  
  button2 = new Button(screenWIncr*42, screenHIncr*2, color(100,0,100), color(70,100,100),0, 1, false); 
  button3 = new Button(screenWIncr*43, screenHIncr*2, color(100,0,100), color(70,100,100),0, 2, false); 
  button4 = new Button(screenWIncr*41, screenHIncr*3, color(200,0,100), color(70,100,100),0, 3, false);  
  button5 = new Button(screenWIncr*42, screenHIncr*3, color(200,0,100), color(70,100,100),0, 4, false); 
  button6 = new Button(screenWIncr*43, screenHIncr*3, color(200,0,100), color(70,100,100),0, 5, false); 
  button7 = new Button(screenWIncr*41, screenHIncr*4, color(200,0,100), color(70,100,100),0, 6, false);  
  button8 = new Button(screenWIncr*42, screenHIncr*4, color(200,0,100), color(70,100,100),0, 7, false); 
  button9 = new Button(screenWIncr*43, screenHIncr*4, color(200,0,100), color(70,100,100),0, 8, false); 
  //SET 1
  button10 = new Button(screenWIncr*41, screenHIncr*7, color(100,0,100), color(70,100,100),1, 0, false);  
  button11 = new Button(screenWIncr*42, screenHIncr*7, color(100,0,100), color(70,100,100),1, 1, false); 
  button12 = new Button(screenWIncr*43, screenHIncr*7, color(100,0,100), color(70,100,100),1, 2, false); 
  button13 = new Button(screenWIncr*41, screenHIncr*8, color(200,0,100), color(70,100,100),1, 3, false);  
  button14 = new Button(screenWIncr*42, screenHIncr*8, color(200,0,100), color(70,100,100),1, 4, false); 
  button15 = new Button(screenWIncr*43, screenHIncr*8, color(200,0,100), color(70,100,100),1, 5, false); 
  button16 = new Button(screenWIncr*41, screenHIncr*9, color(200,0,100), color(70,100,100),1, 6, false);  
  button17 = new Button(screenWIncr*42, screenHIncr*9, color(200,0,100), color(70,100,100),1, 7, false); 
  button18 = new Button(screenWIncr*43, screenHIncr*9, color(200,0,100), color(70,100,100),1, 8, false);
  //SET 2
  button19 = new Button(screenWIncr*41, screenHIncr*12, color(100,0,100), color(70,100,100),2, 0, false);  
  button20 = new Button(screenWIncr*42, screenHIncr*12, color(100,0,100), color(70,100,100),2, 1, false); 
  button21 = new Button(screenWIncr*43, screenHIncr*12, color(100,0,100), color(70,100,100),2, 2, false); 
  button22 = new Button(screenWIncr*41, screenHIncr*13, color(200,0,100), color(70,100,100),2, 3, false);  
  button23 = new Button(screenWIncr*42, screenHIncr*13, color(200,0,100), color(70,100,100),2, 4, false); 
  button24 = new Button(screenWIncr*43, screenHIncr*13, color(200,0,100), color(70,100,100),2, 5, false); 
  button25 = new Button(screenWIncr*41, screenHIncr*14, color(200,0,100), color(70,100,100),2, 6, false);  
  button26 = new Button(screenWIncr*42, screenHIncr*14, color(200,0,100), color(70,100,100),2, 7, false); 
  button27 = new Button(screenWIncr*43, screenHIncr*14, color(200,0,100), color(70,100,100),2, 8, false);
  //SET 3
  button28 = new Button(screenWIncr*41, screenHIncr*17, color(100,0,100), color(70,100,100),3, 0, false);  
  button29 = new Button(screenWIncr*42, screenHIncr*17, color(100,0,100), color(70,100,100),3, 1, false); 
  button30 = new Button(screenWIncr*43, screenHIncr*17, color(100,0,100), color(70,100,100),3, 2, false); 
  button31 = new Button(screenWIncr*41, screenHIncr*18, color(200,0,100), color(70,100,100),3, 3, false);  
  button32 = new Button(screenWIncr*42, screenHIncr*18, color(200,0,100), color(70,100,100),3, 4, false); 
  button33 = new Button(screenWIncr*43, screenHIncr*18, color(200,0,100), color(70,100,100),3, 5, false); 
  button34 = new Button(screenWIncr*41, screenHIncr*19, color(200,0,100), color(70,100,100),3, 6, false);  
  button35 = new Button(screenWIncr*42, screenHIncr*19, color(200,0,100), color(70,100,100),3, 7, false); 
  button36 = new Button(screenWIncr*43, screenHIncr*19, color(200,0,100), color(70,100,100),3, 8, false);    
}

void draw(){
 
//SIZES OF BEATS HERE
if ( beat.isKick() ) kickSize = 200;
if ( beat.isSnare() ) snareSize = 300;
if ( beat.isHat() ) hatSize = 100;
 
 //switches on and off cases that each play a function
 //four different switches, one for each button set -- so that four different buttons are on at same time
switch(setZero){
  case 0:
   bgI();
  break;
  case 1:
  bgB();
   break;  
  case 2:
  bgC();
   break; 
  case 3:
  bgD();
   break; 
  case 4:
  bgE();
   break; 
  case 5:
  bgF();
   break; 
  case 6:
  bgG();
   break; 
  case 7:
  bgH();
   break; 
  case 8:
  bgA();
   break; 
}

switch(setOne){
  case 0:
   snareI();
   break;
  case 1:
   snareB();
   break;  
  case 2:
  snareC();
   break;
   case 3:
  snareD();
   break; 
   case 4:
  snareE();
   break; 
   case 5:
  snareF();
   break; 
   case 6:
  snareG();
   break; 
   case 7:
  snareH();
   break; 
   case 8:
  snareA();
   break;    
}

switch(setTwo){
  case 0:
   kickA();
   break;
  case 1:
   kickB();
   break;  
  case 2:
  kickC();
   break;
   case 3:
  kickD();
   break; 
   case 4:
  kickE();
   break; 
   case 5:
  kickF();
   break; 
   case 6:
  kickG();
   break; 
   case 7:
  kickH();
   break; 
   case 8:
  kickI();
   break;    
}

switch(setThree){
  case 0:
   hatA();
   break;
  case 1:
   hatB();
   break;  
  case 2:
  hatC();
   break;
   case 3:
  hatD();
   break; 
   case 4:
  hatE();
   break; 
   case 5:
  hatF();
   break; 
   case 6:
  hatI();
   break; 
   case 7:
  hatH();
   break; 
   case 8:
  hatG();
   break;    
}
  //CONSTRAIN SIZES FOR BEATS
  kickSize = constrain(kickSize * 0.95, 0, 200);
  snareSize = constrain(snareSize * 0.85, 0, 300);
  hatSize = constrain(hatSize *.95, 0, 200);

//calls the buttons to be displayed and to check to see if the mouse position is over the buttons
//set 1
 button1.display();
 button1.check();
 button2.display();
 button2.check();
 button3.display();
 button3.check();
 button4.display();
 button4.check();
 button5.display();
 button5.check();
 button6.display();
 button6.check();
 button7.display();
 button7.check();
 button8.display();
 button8.check();
 button9.display();
 button9.check();
 //set 2
 button10.display();
 button10.check();
 button11.display();
 button11.check();
 button12.display();
 button12.check();
 button13.display();
 button13.check();
 button14.display();
 button14.check();
 button15.display();
 button15.check();
 button16.display();
 button16.check();
 button17.display();
 button17.check();
 button18.display();
 button18.check();
 //set3
 button19.display();
 button19.check();
 button20.display();
 button20.check();
 button21.display();
 button21.check();
 button22.display();
 button22.check();
 button23.display();
 button23.check();
 button24.display();
 button24.check();
 button25.display();
 button25.check();
 button26.display();
 button26.check();
 button27.display();
 button27.check();
 //set4
 button28.display();
 button28.check();
 button29.display();
 button29.check();
 button30.display();
 button30.check();
 button31.display();
 button31.check();
 button32.display();
 button32.check();
 button33.display();
 button33.check();
 button34.display();
 button34.check();
 button35.display();
 button35.check();
 button36.display();
 button36.check();

//implementing images for the titles of button sets
//  imageMode(CORNER);
//  image(titleA, width-width/10.75, screenHIncr*1, 150, 30);
//  image(titleB, width-width/10.75, screenHIncr*6, 150, 30);
//  image(titleC, width-width/10.75, screenHIncr*11, 150, 30);
//  image(titleD, width-width/10.75, screenHIncr*16, 150, 30);

}/////////END VOID DRAW///////////////


////////BACKGROUND FUNCTIONSSSSSSS///////////
//white rect for background
void bgA (){
  rectMode(CORNER);
  noStroke();
  fill(360, 0,100, 60);
  rect(0,0, width, height);
}

//black rect for background
void bgB (){
  rectMode(CORNER);
  noStroke();
  fill(0,0,0, 10);
  rect(0,0, width, height);
}

//changing hue rect for background
void bgC(){
 rectMode(CORNER);
  fill(hu, 100, 100, 10);
  noStroke();
  rect(0,0, width, height);
  
  hu=hu+increment;
  if(hu>=360 || hu<=1){
  increment= increment*-1;
  } 
}

//wave image array background
void bgD(){
 pushMatrix();
 imageMode(CENTER);
 image(imgList[count], width/2, height/2, width, height);
 count++;    
 if (count>4){  
    count=0;       
  }
 popMatrix();
}

//black n white wave for bg
void bgE(){
  rectMode(CORNER);
  noStroke();
  fill(360, 0, 100,10);
  rect(0,0, width, height);
  //controls how fast the wave is moving  
  theta += 0.02;
  fill(0);
  float x = theta;  
  fill(0,0,0, 30);
  
  // A for loop is used to draw all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 60; i++) {    
  // Calculate y value based off of sine function
  float y = sin(x)*height/2;
  // Draw an ellipse
  ellipse(i*30, y + height/2,100, 100);    
  // Move along x-axis
  x += 0.2;
  }
}

//Hue change rect for background with hue change randomly sized rects on top
void bgF (){
  rectMode(CORNER);
  noStroke();
  fill(hu/2, 100, 100);
  rect(0,0, random(1,width), height);
  fill(hu, 100, 100,10);
  noStroke();
  rect(0,0, random(1,width), height);
  
  hu=hu+increment;
  if(hu<=0 || hu>=360){
  increment=increment*-1;
  }
}

//moody background - image array, and tiled images
void bgG (){
  pushMatrix();
  imageMode(CORNER);
  rectMode(CENTER);
  translate(0,0);
  noStroke();
  fill(0,0,100);
  rect(width/2, height/2, width, height);
  image(imgListA[counta], 0,0, width/2, height/2);
  image(imgListA[counta], 0,height/2, width/2, height/2);
  image(imgListA[counta], width/2,0, width/2, height/2);
  image(imgListA[counta], width/2,height/2, width/2, height/2);
  popMatrix();
    counta++;          //increments the position in teh array up by 1
  if (counta>9) {   //checks if the position has exceeded the 4th position 0,1,2,3
    counta=0;       //if so resets to 0
  }
  
  rectMode(CORNER);
}

//Mac default stary sky image for background
void bgH(){
  pushMatrix();
  imageMode(CENTER);
  image(mac, width/2, height/2, width, height);
  popMatrix();
}

//white grid image array for background
void bgI(){
 pushMatrix(); 
 imageMode(CENTER);
 image(imgListB[countb], width/2, height/2, width, height);
 countb++;    
 if (countb>7){  
    countb=0;       
  }
  popMatrix();
}
//////END BACKGROUND FUNCTIONS////////////

//////START SNARE FUNCTIONS////////////////

//red cubes change their z position to size of snare beat
void snareA(){
pushMatrix();
fill(19,100,100);
stroke(0);
translate(width/2, height/2, -200 + snareSize*4);
// Rotate around y and x axes
rotateY(radians(angle));
rotateX(radians(angle));
// Draw cubes
for (int i = 0; i < cubes.length; i++){
 cubes[i].drawCube();
 }
angle += 0.2;
popMatrix();
}

//white geometric shapes circling around composition
void snareB(){
  //the number of verticies in the shape increases or decreases to snare size
  //larger snare size = more complex, or, more lines and shapes (verticies)
  //i copied the shape four times to make four different circles with different radii (larger and smaller)
  stroke(0);
  fill(100,0,100); 
  int numPoints = int(map(snareSize*2, 0, width, 6,30));
  float angle = 90;
  float angleStep = 180.0/numPoints;
  
 //smallest shape
  beginShape(TRIANGLE_STRIP); 
  for (int i = 0; i <= numPoints; i++) {
    float px = x + cos(radians(angle)) * outsideRadius/4;
    float py = y + sin(radians(angle)) * outsideRadius/4;
    angle += angleStep;
    vertex(px, py);
    px = x + cos(radians(angle)) * insideRadius/4;
    py = y + sin(radians(angle)) * insideRadius/4;
    vertex(px, py); 
    angle += angleStep;
  }
  endShape();
  
    //third largest
    beginShape(TRIANGLE_STRIP); 
    for (int i = 0; i <= numPoints; i++) {
    float px = x + cos(radians(angle)) * outsideRadius;
    float py = y + sin(radians(angle)) * outsideRadius;
    angle += angleStep;
    vertex(px, py);
    px = x + cos(radians(angle)) * insideRadius*1.5;
    py = y + sin(radians(angle)) * insideRadius*1.5;
    vertex(px, py); 
    angle += angleStep;
  }
  endShape();
  
    //second largest
    beginShape(TRIANGLE_STRIP); 
    for (int i = 0; i <= numPoints; i++) {
    float px = x + cos(radians(angle)) * outsideRadius/1.5;
    float py = y + sin(radians(angle)) * outsideRadius/1.5;
    angle += angleStep;
    vertex(px, py);
    px = x + cos(radians(angle)) * insideRadius/2;
    py = y + sin(radians(angle)) * insideRadius/2;
    vertex(px, py); 
    angle += angleStep;
  }
  endShape();
  
  //largest shape
  beginShape(TRIANGLE_STRIP); 
  for (int i = 0; i <= numPoints; i++) {
    float px = x + cos(radians(angle)) * outsideRadius*2;
    float py = y + sin(radians(angle)) * outsideRadius*2;
    angle += angleStep;
    vertex(px, py);
    px = x + cos(radians(angle)) * insideRadius*2;
    py = y + sin(radians(angle)) * insideRadius*2;
    vertex(px, py); 
    angle += angleStep;
  }
  endShape();
}

//purple circles scale to snare size
void snareC(){
  pushMatrix();
  translate(width/2, height/2);
  ellipseMode(CENTER);
  fill(260,100,100);
  stroke(0);
  ellipse(width/-4,0, snareSize*2, snareSize*2);
  ellipse(width/4,0, snareSize*2, snareSize*2); 
  ellipse(width/-4,0, snareSize, snareSize);
  ellipse(width/4,0, snareSize, snareSize); 
  ellipse(width/-4,0, snareSize/2, snareSize/2);
  ellipse(width/4,0, snareSize/2, snareSize/2); 
  popMatrix();
  rectMode(CORNER);
}

//rainbow ball of death photos rotate to snare beat 
void snareD(){
  pushMatrix();
  imageMode(CENTER);
  translate(width/2+width/4, height/2+height/12);
  rotate(radians(snareSize));
  image(beachball, 0,0, width/2, width/2);
  popMatrix();
  
  //this one is smaller and rotates opposite direction
  pushMatrix();
  imageMode(CENTER);
  translate(width/2+width/20, height/4+height/8);
  rotate(radians(snareSize*-1));
  image(beachball, 0,0, height/2, height/2);
  popMatrix();
  kickSize++;
}

//obama face, image on top scales horizontally to snare beat
void snareE(){
//pushMatrix();
//imageMode(CENTER);
//translate(width/2, height/2);
//image(obama, 0,0, width/2+width/4, height/2+height/4);
//image(mouth, height/100,height/10-height/50, snareSize+200, height/9);
//popMatrix();  
pushMatrix();
imageMode(CENTER);
translate(width/2, height/2);
image(obama, 0,0, width/2+width/4, height/2+height/4);
image(mouth, height/100,height/10-height/50, snareSize+100, height/9-height/100);
popMatrix();  
}

//changing hue and size ellipses
void snareF(){
  //stroke and x&y scales change with value of snare beat
  stroke(snareSize, 100, 100);
  noFill();
  strokeWeight(3);
  ellipse(width/2, height/2, snareSize*2, snareSize*2);  
  stroke(snareSize*5, 100, 100);
  strokeWeight(3);
  ellipse(width/2, height/2, snareSize*2, snareSize*2);
  stroke(snareSize, 100, 100);
  
  //two rectangles rotate around the center in opposite directions and scale to snare beat
  pushMatrix();
  rectMode(CENTER);
  translate(width/2, height/2);
  rotate(radians(rot*-1));
  rect(centerX, centerY, snareSize*4, snareSize*4);
  popMatrix();
  
  stroke(snareSize, 100, 100);
  pushMatrix();
  rectMode(CENTER);
  translate(width/2, height/2);
  rotate(radians(rot));
  rect(centerX, centerY, snareSize*4, snareSize*4);
  popMatrix();
  
  //two rects rotate around the center and stay the same size
  //the color of their stroke is programmed to the KickSize values, to give some color variety
  stroke(kickSize/2, 100, 100);
  pushMatrix();
  rectMode(CENTER);
  translate(width/2, height/2);
  rotate(radians(rot));
  rect(centerX, centerY, height/10, height/10);
  popMatrix();

  stroke(kickSize/2, 100, 100);
  pushMatrix();
  rectMode(CENTER);
  translate(width/2, height/2);
  rotate(radians(rot*-1));
  rect(centerX, centerY, width/10, width/10);
  popMatrix();
  rot++;
  rectMode(CORNER);
}

//Blue rects scaling and rotating from center
void snareG(){
//these two rects rotate and scale fom the center to width of comp
//once they reach full width of comp they go back down to start size
//first rect scales fast, second scales slower
pushMatrix();
noFill();
translate(width/2, height/2);
rotate(radians(rot));
stroke(230, 100,100);
strokeWeight(3);
rectMode(CENTER);
rect(0,0,scale, scale);
popMatrix();
scale=scale+20;  

pushMatrix();
noFill();
translate(width/2, height/2);
rotate(radians(rot));
stroke(189, 100,100);
strokeWeight(10);
rectMode(CENTER);
rect(0,0,scale, scale);
popMatrix();
scaleA=scaleA+5;  

//these two rects stay the same scale and rotate around the center
//their stroke size increases and decreases to snare size
pushMatrix();
translate(width/2, height/2);
rotate(radians(rot));
stroke(176, 100,100);
noFill();
strokeWeight(snareSize/2);
rectMode(CENTER);
rect(0,0, width/4, width/4);
popMatrix();

pushMatrix();
translate(width/2, height/2);
rotate(radians(rot+100));
stroke(190, 100,100);
noFill();
strokeWeight(snareSize/4);
rectMode(CENTER);
rect(0,0, width/4, width/4);
popMatrix();
rot++;
//If the rects are greater than the width, they start again at 20px and 10px
//I made two diff variables because I wanted two slightly diff sizes
if(scale>width){
  scale=20;} 
if(scaleA>width){
  scaleA=10;}
  strokeWeight(2);
  rectMode(CORNER);
}

//perspective grid image array
//the Z scale changes to the snare size
void snareH(){
 pushMatrix();
 translate(4,4,snareSize/4);
 noStroke();
 fill(0);
 rectMode(CENTER);
 rect(width/2+width/8, height/4, width/3, height/3); 
 popMatrix(); 
 pushMatrix();
 translate(0,0,snareSize/4);
 imageMode(CENTER);
 image(imgListB[countc], width/2+width/8, height/4, width/3, height/3);
 countc++;    
 if (countc>7){  
    countc=0;       
  }
  popMatrix();
  rectMode(CORNER);
}

//ellipses change scale to the snare size
//their stroke color and opacity is based off of snare size
void snareI(){
  rectMode(CORNER);
  noFill();
  ellipseMode(CENTER);
  stroke(snareSize, 100, 100);
  strokeWeight(3);
  ellipse(width/2, height/2, snareSize*6, snareSize*6);
  fill(snareSize, 100, 100, snareSize/3);
  ellipse(width/2, height/2, snareSize*3, snareSize*3);
}
/////////////END SNARE FUNCTIONS////////////////////////

////////START KICK FUNCTIONS////////////

//crying emoji

void kickA(){
  noStroke();
  pushMatrix();
  imageMode(CENTER);
  translate(width/2, height/2);
  //implement emoji face
  image(face, 0, 0, height/3, height/3);
  
  //two rects change their y-height depending on kick size
  //I had to size these manually, :-(
  rectMode(CORNER);
  fill(190, 100, 100);
  //RIGHT TEAR
  rect(10, 0, width/40, kickSize);
  //LEFT TEAR  
  rect(-33, 0, width/40, kickSize);
  popMatrix();
  rectMode(CORNER);
  }
  
//fetus images
void kickB(){
  noStroke();
  //fetus image moves in y-position to kick beat
  pushMatrix();
  imageMode(CENTER);
  translate(width/4, height/2+height/8);
  image(fetus, 0, kickSize/2*-1, width/4, height/3+height/8);
  popMatrix();
  
  //another fetus image rotates to kick beat
  pushMatrix();
  translate(width/2+width/4, height/2);
  rotate(radians(kickSize));
  image(fetustwo, 0,0, width/4, height/2);
  popMatrix();
  rot++;
}

//little rainbow circles
void kickC(){
//two ellipses rotate around the center and change position based on kick beat
//stroke and fill are based on kick and hat sizes to add some color variety
pushMatrix();
translate(width/2, height/2);
rotate(radians(rot));
stroke(hatSize*5, 100, 100);
strokeWeight(3);
fill(kickSize, 100, 100, kickSize);
ellipse(kickSize, kickSize/2, width/5, width/5);
ellipse(kickSize*-1, kickSize/2*-1, width/5, width/5);
popMatrix();
rot++;
}

//married couple dancing
void kickD(){
//image is slightly rotated and will move it's X position to kick beat
pushMatrix();
imageMode(CENTER);
rotate(radians(15));
translate(kickSize/4, height/4);
image(marriage, width/2,0, width/3, height/2);
popMatrix();

//image rotates in a circle around translate point
pushMatrix();
imageMode(CENTER);
translate(width/8, height/6);
rotate(radians(rot));
image(marriage, 0,0, width/6, height/4);
popMatrix();
rot++;
//different instances of static images
image(marriage, width/8, height/2+height/3, width/6, height/4);
image(marriage, width/8+width/6, height/2+height/3, width/6, height/4);
image(marriage, width/2, height/2+height/3, width/6, height/4);
image(marriage, width/2+width/6, height/2+height/3, width/6, height/4);
image(marriage, width/2+width/6+width/6, height/2+height/3, width/6, height/4);
}

//car thing
void kickE(){  
  //put in car image
//  imageMode(CORNER);
//  image(car, width/8, height/2, car.width, car.height);
//  //rotates front wheel to kick beat
//  pushMatrix();
//  imageMode(CENTER);
//  translate(width/5, height/2+height/6);
//  rotate(radians(kickSize*-2));
//  image(front, 0,0, front.width, front.height);
//  popMatrix();
//  //rotates back wheel to kick beat
//  //i had a reallty hard time getting these to position properly so they're a little messed up in different screen sizes
//  pushMatrix();
//  translate(width/4+width/8-15, height/2+height/6);
//  rotate(radians(kickSize*2));
//  image(back, 0,0, back.width, back.height);
//  popMatrix();
//  rectMode(CORNER);
  imageMode(CENTER);
  image(car, width/2-width/8, height/2+height/8, car.width, car.height);
  //rotates front wheel to kick beat
  pushMatrix();
  imageMode(CENTER);
  translate(width/5, height/2+height/5+10);
  rotate(radians(kickSize*-2));
  image(front, 0,0, front.width, front.height);
  popMatrix();
  //rotates back wheel to kick beat
  //i had a reallty hard time getting these to position properly so they're a little messed up in different screen sizes
  pushMatrix();
  translate(width/2+width/26, height/2+height/5+10);
  rotate(radians(kickSize*2));
  image(back, 0,0, back.width, back.height);
  popMatrix();
  rectMode(CORNER);
  
  }
  
//white cubes
void kickF(){
  //little cubies rotate to the size of kick beat on x, y, z axis
  //this is shown in the function 'display()' in the class 'CubeKick'
  pushMatrix();
  translate(width/2, height/2, -130);
  rotateX(frameCount * 0.001);
  rotateY(frameCount * 0.002);
  rotateZ(frameCount *0.002);
  stroke(255);
  // Move and rotate cubies
  for (CubeKick c : coobies) {
    c.update();
    c.display();
  }
popMatrix();
rectMode(CORNER);
}

//shaking finger
void kickG(){
  //three instances of finger images rotate tothe kick beat
  pushMatrix();
  translate(width/2, height/2);
  imageMode(CENTER);
  rotate(radians(kickSize/2-45));
  image(finger, 0,0, finger.width/2, finger.height/2);
  popMatrix();
  pushMatrix();
  translate(width/2+width/8, height/2);
  imageMode(CENTER);
  rotate(radians(kickSize/2-45));
  image(finger, 0,0, finger.width/2, finger.height/2);
  popMatrix();
  pushMatrix();
  translate(width/2+width/-8, height/2);
  imageMode(CENTER);
  rotate(radians(kickSize/2-45));
  image(finger, 0,0, finger.width/2, finger.height/2);
  popMatrix();
}
//liquid bloby thinggssss
void kickH(){
 //a bunch of instances of liquid blob image array
 //basically, this section of code is messy b/c i was trying to position the images a different way,
 //because i rotated the images and set their scale dependent on width and height,
 //they weren't positioning and scaling how I wanted them to
 //and when I was playing around with it, I liked how this looked, so I kept it this way
 //there are two different push matricies because it was a faster method of changing the positions
 //y-position is changed to kick beat
 pushMatrix();
 imageMode(CENTER);
 translate(width/32, kickSize/2-height/4);
 rotate(radians(-45));
 image(imgListD[counte], width/-4, height, imgListD[counte].width*2, imgListD[counte].height*2);
 image(imgListD[counte], width/-8, height+height/8, imgListD[counte].width*2, imgListD[counte].height*2);
 image(imgListD[counte], 0, height-height/4, imgListD[counte].width*2, imgListD[counte].height*2);
 popMatrix();
 pushMatrix();
 imageMode(CENTER);
 translate(width/8, kickSize/2-height/2);
 rotate(radians(-45));
 image(imgListD[counte], width/-4, height, imgListD[counte].width*2, imgListD[counte].height*2);
 image(imgListD[counte], width/-8, height+height/8, imgListD[counte].width*2, imgListD[counte].height*2);
 image(imgListD[counte], 0, height-height/4, imgListD[counte].width*2, imgListD[counte].height*2);
 popMatrix();
 counte++;    
 if (counte>9){  
    counte=0;       
  }
}
//stars
void kickI(){
  //points that are added on randomly that will change x, y, and z position to the kick beat
  pushMatrix();
  translate(kickSize, kickSize, kickSize*2);
  stroke(200,0,100);
  strokeWeight(4);
  point(random(0,width), random(0,height));
  point(random(0,width), random(0,height));
  popMatrix();
}
/////////////END KICK BEAT FUNCTIONS///////////////

///////////START HAT BEAT FUNCTIONS///////////////

//green cubes
void hatA(){
   //little cubies rotate to the size of hat beat on x, y, z axis
  //this is shown in the function 'display()' in the class 'CubeA'
  //essentially the same thing as what is happening int the kickF function
  pushMatrix();
  translate(width/2, height/2, -130);
  // Rotate everything, including external large cube
  rotateX(frameCount * 0.001);
  rotateY(frameCount * 0.002);
  rotateZ(frameCount *0.002);
  stroke(255);
  // Move and rotate cubies
  for (CubeA c : cubies) {
    c.update();
    c.display();
  }
popMatrix();
rectMode(CORNER);
}
//rainbow center ellipses
void hatB(){
  //two ellipses that scale X size to the hat beat
  //their stroke hue changes to value of hat beat
  rectMode(CORNER);
  pushMatrix();
  translate(width/2, height/2);
  noFill();
  rotate(radians(45));
  stroke(hatSize, 100, 100);
  strokeWeight(3);
  ellipse(0,0, hatSize*6, 100);
  popMatrix(); 
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(135));
  stroke(hatSize, 100, 100);
  strokeWeight(3);
  ellipse(0,0, hatSize*6, 100);
  popMatrix();

  hu=hu+increment;
  if(hu<=0 || hu>=360){
    increment=increment*-1;
  }
}

//scared face emoji
void hatC(){
  //three emoji images that rotate to value of hat beat
 pushMatrix();
 imageMode(CENTER);
 translate(width/2, height/2);
 rotate(radians(hatSize));
 image(emoji,0,0, width/8, width/8);
 popMatrix();
 hatSize++; 
 //LEFT EMOJI
 pushMatrix();
 imageMode(CENTER);
 translate(width/2-width/4, height/2);
 rotate(radians(hatSize));
 image(emoji,0,0, width/8, width/8);
 popMatrix();
 hatSize++;
//RIGHT EMOJI
 pushMatrix();
 imageMode(CENTER);
 translate(width/2+width/4, height/2);
 rotate(radians(hatSize));
 image(emoji,0,0, width/8, width/8);
 popMatrix();
 hatSize++;
 rectMode(CORNER);
}

//purple horse
void hatD(){
 pushMatrix();
 imageMode(CENTER);
 translate(width/2+width/8, height/2+height/6);
 image(imgListC[countd], hatSize/4, 0, imgListC[countd].width*2, imgListC[countd].height*2);
 countd++;    
 if (countd>9){  
    countd=0;       
  }
  popMatrix();
  rectMode(CORNER);
}

//dancing baby girls
void hatE(){
  //two baby images that rotate to hat beat and face each other
  pushMatrix();
  translate(width/2-width/8, height/2);
  imageMode(CENTER);
  rotate(radians(hatSize*-1-90));
  image(bbB,0,0, bbB.width/2, bbB.height/2);
  popMatrix();
  
  pushMatrix();
  translate(width/2+width/8, height/2);
  imageMode(CENTER);
  rotate(radians(hatSize-90));
  image(bbA,0,0, bbA.width/2, bbA.height/2);
  popMatrix();
  rectMode(CORNER);
}

//BYE and HI text
void hatF(){
  //BYE text moves X-position to size of hat beat plus 300px so it is bottom right
  //fill color changes to hat size
  pushMatrix();
  translate(width/4, height/4);
  fill(hatSize, 100, 100);
  textFont(font, 400);
  text("BYE", 300+hatSize, height/2);
  popMatrix();
  
  //HI text rotates around in a circle and is positioned top left
  //fill color hue changes to hat beeat value
  pushMatrix();
  translate(width/4, height/3);
  fill(hatSize/2, 100, 100);
  rotate(radians(rot));
  textSize(250);
  text("HI", 0,0);
  popMatrix();
  rot++;
}

//green circles
void hatG(){
  //green ellipses scale to hat size
  pushMatrix();
  translate(width/2, height/2);
  ellipseMode(CENTER);
  fill(100,100,100);
  stroke(0);
  ellipse(width/-4,0, hatSize*2, hatSize*2);
  ellipse(width/4,0, hatSize*2, hatSize*2); 
  ellipse(width/-4,0, hatSize, hatSize);
  ellipse(width/4,0, hatSize, hatSize); 
  ellipse(width/-4,0, hatSize/2, hatSize/2);
  ellipse(width/4,0, hatSize/2, hatSize/2); 
  popMatrix();

}
//flashing rainbow rects from center
void hatH(){
pushMatrix();
noFill();
translate(width/2, height/2);
rotate(radians(rot*-1));
//strokes colors are randomized and different for each rect
//all stroke weights increase/decrease to hat beat value
//first three rects scale up from small value and go back down to 10px scale when reach width
stroke(random(170, 355), 100,100);
strokeWeight(hatSize);
rectMode(CENTER);
rect(0,0,scaleA, scaleA);
stroke(random(1,89), 100,100);
rect(0,0,scaleB, scaleB);
stroke(random(90,169), 100,100);
rect(0,0,scaleC, scaleC);
//this rect stays with a static scale
stroke(random(1,89), 100,100);
rect(0,0,width/8, width/8);
popMatrix();
scaleA=scaleA+4;  
scaleB=scaleB+4;
scaleC=scaleC+4;
rot++;
//if scale is greater than width goes back down to 10
//i made three different variables here b/c they all have a different value -- some larger, some smaller
if(scaleA>width){
  scaleA=10;} 
if(scaleB>width){
  scaleB=10;}
if(scaleC>width){
  scaleC=10;}  
  
rectMode(CORNER);
}

//do it for the aesthetic
void hatI(){
  //this image rotates around it's fixed position, top left
  pushMatrix();
  translate(width/4, height/4);
  imageMode(CENTER);
  rotate(radians(rot));
  image(aesthetic, 0,0, aesthetic.width, aesthetic.height);
  popMatrix();
  rot++;
  //this image array changes it's Y position to the hat beat 
  pushMatrix();
  translate(width/2+width/4, height/2+height/4);
  image(imgListE[countf], hatSize/4, 0, imgListE[countf].width*2, imgListE[countf].height*2);
  popMatrix();
  countf++;    
  if (countf>9){  
    countf=0;       
  }
}
