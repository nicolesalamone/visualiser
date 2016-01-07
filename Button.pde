class Button {
 float  X, Y;
  int setNo, buttonNo;//variables for button size, location and the scene number assigned to it
 color overClr, buttonClr;//variables for colors
 boolean over=false;//var of changing color state
 boolean hover;//boolean to chandge when the mouse is over a button
 int W=20;//button width
 int H=20; //button height


 //Constructor for Button Object
 Button(float tempX, float tempY, color tempBClr, color tempOvrClr, int tempSetNo, int tempButtonNo, boolean tempHover){
   X=tempX;
   Y=tempY;
   overClr=tempOvrClr;
   buttonClr=tempBClr;
   setNo=tempSetNo;
   buttonNo=tempButtonNo;
   hover=tempHover;

 }
 
 //draws the button
 void display(){
    //noStroke();
    stroke(0);
    strokeWeight(2);
    if(over==true){//sets the fill color based on mouse
       fill(overClr); 
      }else{
       fill(buttonClr);
     }    
   pushMatrix();  
   translate(X,Y);
   rect(0,0,W,H);
   popMatrix();
 }
 

//checks to see if the mouse is over the button 
 
 void check(){
   if(mouseX>=X && mouseX<=X+W && mouseY>=Y && mouseY<=Y+H){
     over=true;//changes color of button
     hover=true;//allows click to change picture 
     if (mousePressed){
       if(setNo==0){
      setZero=buttonNo;//sets selected to true
       } else if (setNo==1){
      setOne=buttonNo;
       } else if (setNo==2){
      setTwo=buttonNo;
       } else if (setNo==3){
       setThree=buttonNo;
       }
     }
   }else{
     over=false;
     hover=false;
   }
   }
 
}
