import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class AsteroidsGame extends PApplet {

ArrayList <Asteroid> asteroids;
SpaceShip normandy;
Star[] nebula;
int thingiesLength;
int starLength;
boolean blink, doneBlinking;
Blinker[] blinkers;
boolean menu, game, dialouge;
Button startButton, buttonOne, buttonTwo, buttonThree;
ArrayList <Scene> scenes, pastScenes;
ArrayList <Note> notes;
Scene scene1, scene2, scene3, scene4, scene5;
Note note1;
int gameCounter, deathCounter;
//Bullet testB;
ArrayList <Bullet> bullets;

public void setup() 
{
  
  //menu = true;
  game = true;
  gameCounter = 0;
  //GAME SETUP
  size(1000, 700);
  //thingiesLength = 12; //Declare Arrays
  starLength = 100;
  
  bullets = new ArrayList <Bullet>();
  blinkers = new Blinker[10];
  asteroids = new ArrayList <Asteroid>();
  nebula = new Star[starLength];
  normandy = new SpaceShip();
  
  scene1 = new Scene(1, "Wake up, Eva.", "What's going on?", 5, "Who are you?", 0, "Where am I?", 4);
  scene2 = new Scene(2, 0, "Don't worry, let's just try that again. We have plenty of time.");
  scene3 = new Scene(3, 1, "Test1 - this is the drop scene for unwritten paths.", "Test2");
  scene4 = new Scene(4, "... ", "You're not listening to me, are you?", 1);
  scene5 = new Scene(5, "Okay, interesting. Do you think you're thinking clearly right now?", "What? Of course I am!", 3, "What do you mean, 'thinking clearly'?", 3, "I'm not going to answer you until you tell me what is going on.", 3);
  note1 = new Note(300, 35, 350, 100, "Test test test test test test test test test test test", 100, 20);
  scenes = new ArrayList <Scene>();
  notes = new ArrayList<Note>();
  scenes.add(scene1); scenes.add(scene2); scenes.add(scene3); scenes.add(scene4); scenes.add(scene5);
  

  for (int i = 1; i < 12; i ++) { //Initialize objects.
     asteroids.add( new Asteroid() );
  }
  for (int i = 0; i < starLength; i ++) {
    nebula[i] = new Star();
  }
  for (int i = 0; i < 10; i ++) {
    blinkers[i] = new Blinker();
  }
  startButton = new Button(500, 400, 400, 100, "Start");
  //400, 525, 600
  buttonOne = new ClearButton(75, 335, 850, 100);
  buttonTwo = new ClearButton(75, 460, 850, 100);
  buttonThree = new ClearButton(75, 580, 850, 100);

}

public void draw() 
{
  //your code here
  
  if (game) { // GAME CODE
    background(0); // Showing game elements
    keyActions();
    
    for (int i = 0; i < starLength; i ++) {
      nebula[i].show();
    }
    normandy.move();
    normandy.show();
    for (int i = 0; i < bullets.size(); i ++) {
      bullets.get(i).show();
      bullets.get(i).move();
    }
     
    /*for (int i = asteroids.size(); i > 0; i --) {
      for (int j =  bullets.size(); j > 0; j --) {
        float checkDestruction = dist( bullets.get(j).getX(), bullets.get(j).getY(), asteroids.get(i).getX(), asteroids.get(i).getY());
        if (checkDestruction < 25) {
          asteroids.remove(asteroids.get(i));
          bullets.remove(bullets.get(j));
          if (asteroids.size() > 0) {
            i --;
          }
        }
      }
    }*/
      
    for (int i = 0; i < asteroids.size(); i ++) {
      float checkCollision = dist( normandy.getX(), normandy.getY(), asteroids.get(i).getX(), asteroids.get(i).getY());
      if (checkCollision < (25*asteroids.get(i).getSizeMult()) && gameCounter > 10) {
        game = false; dialouge = true; 
        deathActions();
      } 
      
        asteroids.get(i).move();
        asteroids.get(i).show();
    }
    for (int i = 0; i < blinkers.length; i ++) {
      blinkers[i].move();
      blinkers[i].show();
    }
    gameCounter ++; //Advances a counter each turn. 
    /*if (gameCounter > 400) {
      note1.show();
    }*/
    
  } else if (menu) { //Draws the start menu if "menu" is true.
    background(0);
    textSize(150);
    stroke(0, 0, 255);
    fill(0, 0, 255);
    text("Asteroids", 100, 300);
    textSize(50);
    text("Thomas White", 100, 500);
    textSize(30);
    text("Click to 'play' - (even though it's not really a game yet)", 100, 600);
    startButton.show();
  } else if (dialouge) { //Shows scenes if scene is true
    scenes.get(0).show();
    if (scenes.get(0).getAnswerNum() == 1 ) {
      ((ClearButton)(buttonOne)).show();
    } else if ( scenes.get(0).getAnswerNum() == 2  ) {
      ((ClearButton)(buttonOne)).show();
      ((ClearButton)(buttonTwo)).show();
    } else if ( scenes.get(0).getAnswerNum() == 3 ) {
      ((ClearButton)(buttonOne)).show();
      ((ClearButton)(buttonTwo)).show();
      ((ClearButton)(buttonThree)).show();
    }
  }
}
  



class SpaceShip extends Floater implements Floatable
{   
    //your code here
    public void setX(int x) {myCenterX = x;}
    public int getX() {return (int)myCenterX;}
    public void setY(int y) {myCenterY = y;}
    public int getY() {return (int)myCenterY;}
    public void setDirectionX(double x) {myDirectionX = x;}
    public double getDirectionX() {return myDirectionX;}
    public void setDirectionY(double y) {myDirectionY = y;}
    public double getDirectionY() {return myDirectionY;}
    public void setPointDirection(int degrees) {myPointDirection = degrees;}
    public double getPointDirection() {return myPointDirection;}

    public SpaceShip()
    {
      corners = 22;
      
      int[] setXArray = {16, 4, 8, 8, 0, -8, -8, -12, -12, -8, -8, -12, -8, -8, -12, -12, -8, -8, 0, 8, 8, 4};
      int[] setYArray = {0, 8, 8, 12, 12, 20, 12, 12, 8, 8, 4, 0, -4, -8, -8, -12, -12, -20, -12, -12, -8, -8};    

      xCorners = setXArray;
      yCorners = setYArray;

      myColor = color(0, 0, 255);
      myCenterX = 300;
      myCenterY = 300;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
    }

    public void accelerate(float accelMod) {
      int limit = 6;
      if ( (myDirectionX < limit && myDirectionX > -limit) && (myDirectionY > -limit && myDirectionY < limit) ) {
        super.accelerate(accelMod);
      } else {
        if (myDirectionX >= limit) {
          myDirectionX = limit - 1;
        } else if (myDirectionX <= -limit) {
          myDirectionX = -limit + 1;
        } else if (myDirectionY >= limit) {
          myDirectionY = limit - 1;
        } else if (myDirectionY <= -limit) {
          myDirectionY = -limit + 1;
        }
      }

    }
    
}

class Star
{
  private double myX, myY;
  public Star() 
  {
    myX = Math.random()*width;
    myY = Math.random()*height;
  }
  public void setX(int x) {myX = x;}
  public int getX() {return (int)myX;}
  public void setY(int y) {myY = y;}
  public int getY() {return (int)myY;}
  public void show() {
    noStroke();
    fill(255);
    quad( (int)(myX + 1), (int)myY, (int)myX, (int)(myY -1), (int)(myX -1), (int)myY, (int)myX, (int)(myY + 1) );
  }

}

class Blinker extends Floater implements Floatable
{
  int timeCounter;
  public Blinker()
  {
    corners = 4;
    xCorners = new int[4];
    yCorners = new int[4];
    xCorners[0] = 3;
    xCorners[1] = 0;
    xCorners[2] = -3;
    xCorners[3] = 0;
    yCorners[0] = 0;
    yCorners[1] = -3;
    yCorners[2] = 0;
    yCorners[3] = 3;

    myColor = color(0, 0, 255);
    myCenterX = -10;
    myCenterY = -10;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
    timeCounter = 0;
  }
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}

  public void move() {
    if (blink && (Math.random() > .9f)   ) {
      myCenterX = normandy.getX();
      myCenterY = normandy.getY();
      myPointDirection = normandy.getPointDirection() - 180;      
      double newRadians = (normandy.getPointDirection()*(Math.PI/180)) + Math.PI; 
      myDirectionX = 5*(Math.cos(newRadians));
      myDirectionY = 5*(Math.sin(newRadians));
      timeCounter = 0;
      blink = false;
    } else {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
    }

    if(myCenterX >width)
    {     
      myCenterX = 0;    
    } else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }  else if (myCenterY < 0)
    {     
      myCenterY = height;      
    }

    timeCounter ++;
  }
  public void show() {
    double plumeLength = sqrt( (float)( normandy.myDirectionY*normandy.myDirectionY ) + (float)( normandy.myDirectionX * normandy.myDirectionX ) );

    if (timeCounter < (int)plumeLength*4) {
      super.show();
    }
  }
}

class Asteroid extends Floater implements Floatable
{
  private double myRotSpeed;
  private int sizeMult;
  public Asteroid()
  {
    sizeMult = (int)(Math.random()*5);
    corners = 6;

    int[] setXArray = {sizeMult*16, sizeMult*12, sizeMult*0, sizeMult*-24, sizeMult*-32, sizeMult*-8};
    int[] setYArray = {sizeMult*12, sizeMult*-20, sizeMult*-12, sizeMult*-24, sizeMult*4, sizeMult*24};

    xCorners = setXArray;
    yCorners = setYArray;

    myColor = color(0, 0, 255, 100);
    myCenterX = Math.random()*width;
    myCenterY = Math.random()*height;
    myDirectionX = (Math.random()*3)-1.5f;
    myDirectionY = (Math.random()*3)-1.5f;
    myPointDirection = Math.random()*360;

    myRotSpeed = (Math.random()*6)-3;
  }
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
  public void setSizeMult(int x) {sizeMult = x;}
  public int getSizeMult() {return sizeMult;}


  public void move() {
    rotate( (int)myRotSpeed );
    super.move();
  }

}

public class Bullet extends Floater {
  public Bullet(SpaceShip n) {
    myCenterX = n.getX();
    myCenterY = n.getY();
    myPointDirection = n.getPointDirection();
    double dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = (5*(Math.cos(dRadians))) + n.getDirectionX();
    myDirectionY = (5*(Math.sin(dRadians))) + n.getDirectionY();
    corners = 4;

    //int[] setXArray = {0, 4, 4, -4, -4};
    //int[] setYArray = {8, 4, -4, -4, 4};    
    int[] setXArray = {4, -4, -4, 4};
    int[] setYArray = {-2, -2, 2, 2};

    xCorners = setXArray;
    yCorners = setYArray;
    myColor = color(0, 0, 255);
  }
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}

  public void move() {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;   

    if (myCenterX >width || myCenterX<0 || myCenterY >height || myCenterY < 0) {     
      bullets.remove(this);
    }
  }
}



abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE); 
  }   
} 

interface Floatable
{
  public void move();
  public void show();
}


abstract class TextBoundary
{
  protected int myX, myY, myWidth, myHeight, myRightBound, myBottomBound;
  protected String myText;
  public TextBoundary() {
    myX = 0; myY = 0; myWidth = 0; myHeight = 0; myText = "test";
  }
  public TextBoundary(int x, int y, int wid, int hgt) {
    myX = x;
    myY = y;
    myWidth = wid;
    myHeight = hgt;
    myText = "Delete";
  }
  public TextBoundary(int x, int y, int wid, int hgt, String txt) {
    myX = x;
    myY = y;
    myWidth = wid;
    myHeight = hgt;
    myText = txt;
  }
 
  public void setX(int x) {myX = x;}
  public int getX() {return myX;}
  public void setY(int y) {myY = y;}
  public int getY() {return myY;}
  public void setWidth(int wid) {myWidth = wid;}
  public int getWidth() {return myWidth;}
  public void setHeight(int hgt) {myHeight = hgt;}
  public int getHeight() {return myHeight;}
  public void setText(String txt) {myText = txt;}
  public String getText() {return myText;}
}

public class Button extends TextBoundary
{
  
  public Button() {}
  public Button(int x, int y, int wid, int hgt, String txt) {
    myX = x;
    myY = y;
    myWidth = wid;
    myHeight = hgt;
    myText = txt;
  }

  public void show() {
    fill(0, 0, 255);
    noStroke();
    rect(myX, myY, myWidth, myHeight);
    textSize(myHeight/2);
    if (!(myText == "Delete")) {
      fill(0);
      stroke(0);
      text(myText, myX + 140, myY + 70);
    }
  }
}

class ClearButton extends Button{
  public ClearButton(int x, int y, int wid, int hgt) {
    myX = x;
    myY = y;
    myWidth = wid;
    myHeight = hgt;
    myText = "Delete";
  }
  public void show(){
    if (mouseX > myX && mouseX < (myX + myWidth) && mouseY > myY && mouseY < (myY + myHeight)) {
      fill(0, 0, 255, 100);
      noStroke();
      rect(myX, myY, myWidth, myHeight);
      textSize(myHeight/2);
      if (!(myText == "Delete")) {
        fill(0);
        stroke(0);
        text(myText, myX + 140, myY + 70);
      }
    }
  }
}

public class Note extends TextBoundary
{
  int textColor, triggerPoint; 
  public Note() {}
  public Note (int x, int y, int wid, int hgt, String txt, int colr, int trig) {
    myX = x;
    myY = y;
    myWidth = wid;
    myHeight = hgt;
    myText = txt;
    textColor = colr;
    triggerPoint = trig;
  }
  public void show() {
    if (gameCounter > triggerPoint) {
      fill(0, 0, 255, 100);
      noStroke();
      rect(myX, myY, myWidth, myHeight);
      fill(0);
      stroke(textColor);
      textSize(20);
      text(myText, myX + 10, myY + 10, myWidth - 10, myHeight - 10);
      
    }
  }
}

public class Scene
{
  protected int myIndex, choiceOne, choiceTwo, choiceThree, answerNum, textBoxNum;
  protected String myTextOne, myTextTwo, myTextThree, choiceOneText, choiceTwoText, choiceThreeText;
  public Scene() {
    myIndex = 0; choiceOne = 0; choiceTwo = 0; choiceThree = 0; myTextOne = "Test"; myTextTwo = "Test"; myTextThree = "Test"; choiceOneText = "Test"; choiceTwoText = "Test"; choiceThreeText = "Test"; answerNum = 3; textBoxNum = 1;
  }
  public Scene(int index, String txt1, String txt2, String txt3, String chcOneTxt, int chcOne, String chcTwoTxt, int chcTwo, String chcThreeTxt, int chcThree, int aNum, int txtbx)  {
    myIndex = index;  myTextOne = txt1; myTextTwo = txt2; myTextThree = txt3;
    choiceOne = chcOne; choiceTwo = chcTwo; choiceThree = chcThree; choiceOneText = chcOneTxt; choiceTwoText = chcTwoTxt; choiceThreeText = chcThreeTxt;
    answerNum = aNum; textBoxNum = txtbx;
  }
  public Scene(int index, int chc1, String txt1, String txt2, String txt3 ) {
    myIndex = index; myTextOne = txt1; myTextTwo = txt2; myTextThree = txt3; 
    choiceOne = chc1; choiceTwo = -1; choiceThree = -1; choiceOneText = "na"; choiceTwoText = "na"; choiceThreeText = "na"; 
    answerNum = 0; textBoxNum = 3;
  }
  public Scene(int index, int chc1, String txt1, String txt2) {
    myIndex = index; myTextOne = txt1; myTextTwo = txt2; myTextThree = "na"; 
    choiceOne = chc1; choiceTwo = -1; choiceThree = -1; choiceOneText = "na"; choiceTwoText = "na"; choiceThreeText = "na"; 
    answerNum = 0; textBoxNum = 2;
  }
  public Scene(int index, int chc1, String txt1) {
    myIndex = index; myTextOne = txt1; myTextTwo = "na"; myTextThree = "na"; 
    choiceOne = chc1; choiceTwo = -1; choiceThree = -1; choiceOneText = "na"; choiceTwoText = "na"; choiceThreeText = "na"; 
    answerNum = 0; textBoxNum = 1;
  }
  public Scene(int index, String txt1, String chc1txt, int chc1) {
    myIndex = index; myTextOne = txt1; myTextTwo = "na"; myTextThree = "na"; 
    choiceOne = chc1; choiceTwo = -1; choiceThree = -1; choiceOneText = chc1txt; choiceTwoText = "na"; choiceThreeText = "na"; 
    answerNum = 1; textBoxNum = 1;
  }
  public Scene(int index, String txt1, String chc1txt, int chc1, String chc2txt, int chc2) {
    myIndex = index; myTextOne = txt1; myTextTwo = "na"; myTextThree = "na"; 
    choiceOne = chc1; choiceTwo = chc2; choiceThree = -1; choiceOneText = chc1txt; choiceTwoText = chc2txt; choiceThreeText = "na"; 
    answerNum = 2; textBoxNum = 1;
  }
  public Scene(int index, String txt1, String chc1txt, int chc1, String chc2txt, int chc2, String chc3txt, int chc3) {
    myIndex = index; myTextOne = txt1; myTextTwo = "na"; myTextThree = "na"; 
    choiceOne = chc1; choiceTwo = chc2; choiceThree = chc3; choiceOneText = chc1txt; choiceTwoText = chc2txt; choiceThreeText = chc3txt; 
    answerNum = 3; textBoxNum = 1;
  }
  
  public void setIndex(int index) {myIndex = index;}
  public int getIndex() {return myIndex;}
  public void setTextOne(String txt) {myTextOne = txt;}
  public String getTextOne() {return myTextOne;}
  public void setTextTwo(String txt) {myTextTwo = txt;}
  public String getTextTwo() {return myTextTwo;}
  public void setTextThree(String txt) {myTextThree = txt;}
  public String getTextThree() {return myTextThree;}
  public void setChoiceOne(int chcOne) {choiceOne = chcOne;}
  public int getChoiceOne() {return choiceOne;}
  public void setChoiceTwo(int chcTwo) {choiceTwo = chcTwo;}
  public int getChoiceTwo() {return choiceTwo;}
  public void setChoiceThree(int chcThree) {choiceThree = chcThree;}
  public int getChoiceThree() {return choiceThree;}
  public void setChoiceOneText(String chcOneTxt) {choiceOneText = chcOneTxt;}
  public String getChoiceOneText() {return choiceOneText;}
  public void setChoiceTwoText(String chcTwoTxt) {choiceTwoText = chcTwoTxt;}
  public String getChoiceTwoText() {return choiceTwoText;}
  public void setChoiceThreeText(String chcThreeTxt) {choiceThreeText = chcThreeTxt;}
  public String getChoiceThreeText() {return choiceThreeText;}
  public void setAnswerNum(int aNum) {answerNum = aNum;}
  public int getAnswerNum() {return answerNum;}

  public void show() {
    background(0);
    textSize(40);
    //fill(0, 255, 0);
    fill(0, 0, 255);

    if (textBoxNum == 1) {
      text(myTextOne, 100, 100, 800, 400);
    } else if (textBoxNum == 2) {
      text(myTextOne, 100, 100, 800, 400);
      //fill(160, 50, 168);
      
      text(myTextTwo, 100, 300, 800, 400);
    } else if (textBoxNum == 3) {
      text(myTextOne, 100, 100, 800, 400);
      //fill(0, 0, 255);
     
      text(myTextTwo, 100, 300, 800, 400);
      //fill(0, 255, 0);
      
      text(myTextTwo, 100, 500, 800, 400);
    }
    
    fill(0, 0, 255);
    
    if (answerNum == 0) {
      textSize(10);
      text( "(Click to continue)", width/2 - 40, 600);
    } else if (answerNum == 1) {
      text(choiceOneText, 100, 400);
    } else if (answerNum == 2) {
      text(choiceOneText, 100, 400);
      text(choiceTwoText, 100, 525);
    } else if (answerNum == 3) {
      text(choiceOneText, 100, 400 /*600, 100*/);
      text(choiceTwoText, 100, 525 /*600, 100*/);
      text(choiceThreeText, 100, 650 /*600, 100*/);
    }
  }

  public void triggerNextScene() {

      int chc = 9;

      if (answerNum == 0) {
        chc = choiceOne;
      } else if (checkIfInside(buttonOne)) {
        chc = choiceOne;

      } else if (checkIfInside(buttonTwo)) {
        chc = choiceTwo;
      } else if (checkIfInside(buttonThree)) {
        chc = choiceThree;
      }
    if (chc == 0) {
      game = true; dialouge = false; resetGame(); gameSetup();
    }
    
    
    for (int i = 0; i < scenes.size(); i ++) {
      if (scenes.get(i).getIndex() == chc) {
        scenes.add(0, scenes.remove(i));
        System.out.println("t");
      }
    }
  }
}

boolean aIsPressed = false;
boolean sIsPressed = false;
boolean dIsPressed = false;
boolean wIsPressed = false;
boolean spaceIsPressed = false;

int shotCounter = -10;

public void keyPressed() {
  if (key == 'a' || key == 'A') {
    aIsPressed = true;
  } else if (key == 'd' || key =='D') {
    dIsPressed = true;
  } else if (key == 'w' || key == 'W') {
    wIsPressed = true;
  } else if (key == 's' || key == 'S') {
    sIsPressed = true;
  } else if (key == 'q' || key == 'Q') {
    normandy.setX((int)(Math.random()*width));
    normandy.setY((int)(Math.random()*height));
    normandy.setPointDirection((int)(Math.random()*360));
    normandy.setDirectionX(0);
    normandy.setDirectionY(0);
  } else if (key == 32) {
    if (shotCounter + 10 < gameCounter) {
      bullets.add(new Bullet(normandy));
      shotCounter = gameCounter;
      System.out.println("Test");
    }
  }
}

public void keyReleased() {
  if (key == 'a' || key == 'A') {
    aIsPressed = false;
  } else if (key == 'd' || key =='D') {
    dIsPressed = false;
  } else if (key == 'w' || key == 'W') {
    wIsPressed = false;
  } else if (key == 's' || key == 'S') {
    sIsPressed = false;
  } else if (keyCode == 32) {
    spaceIsPressed = false;
  }
}

public void keyActions() {  // S is also set to do forwards. 
  if (wIsPressed) {
    normandy.accelerate(0.3f);
    blink = true;
  } else if (sIsPressed) {
    normandy.accelerate(0.3f);
    blink = true;
  } else if (aIsPressed) {
    normandy.rotate(-8);
  } else if (dIsPressed) {
    normandy.rotate(8);
  } else if (wIsPressed && aIsPressed) {
    normandy.accelerate(0.3f);
    blink = true;
    normandy.rotate(-8);
  } else if (wIsPressed && dIsPressed) {
    normandy.accelerate(0.3f);
    blink = true;
    normandy.rotate(8);
  } else if (sIsPressed && aIsPressed) {
    normandy.accelerate(0.3f);
    blink = true;
    normandy.rotate(-8);
  } else if (sIsPressed && dIsPressed) {
    normandy.accelerate(0.3f);
    blink = true;
    normandy.rotate(8);
  } 
}

public void mousePressed() {
  if (menu && checkIfInside(startButton) ) {
    menu = false;
    dialouge = true;
  } else if (dialouge) {  
      scenes.get(0).triggerNextScene();
  }
}

public boolean checkIfInside(Button b) {
  if (mouseX > b.getX() && mouseX < ( b.getX() + b.getWidth() ) && mouseY > b.getY() && mouseY < (b.getY() + b.getHeight() ) ) {
    return true;
  } else {
    return false;
  }
}

public void resetGame() {
  normandy.setX( (int)(Math.random()*width) );
  normandy.setY( (int)(Math.random()*height) );
  normandy.setDirectionX(0);
  normandy.setDirectionY(0);
  normandy.setPointDirection(0);
  gameCounter = 0;
  shotCounter = -10;
}

public void deathActions() {
  resetGame();
  if (deathCounter == 0) {
    for (int i = 0; i < scenes.size(); i ++) {
      if (scenes.get(i).getIndex() == 2) {
        scenes.add(0, scenes.remove(i));
      }
    }
    
  } // Add more based on what scene you go to after each death.
  deathCounter++;
}

public void gameSetup() {
  //Find most recent scene, and from that scene extrapolate conditions on whcih level you're going into. 
}

//TO DO
/*

Make sure the simultanious keyu presses are dealt with. 
Shape of Asteroids.

Farther collision distance.
Scene-to-scene transition
Resetgame also resets asteroids

Only allow scene change after a pause, to stop double clicks?

Fix asteroid collision. 

Asteroid Size


LONG - TERM
Special larger bukllets? Laser? Other firing methods?
Simplify everything into component functions. 
Make hyperspace a limited resource later on, a way to escape a crisis. Powerups?
Hyperspace doesn't drop you on an asteroid. 

COMPLETED
Change the shape of the spaceship. Diamond with two wings. YAY!
Make the spaceship have a drive. Ambitious particle drive v.s. color change? YAY!
Make a scene class which displays text in three places as well as text along the top. Each scene has an index. YAY
The scenes will get an arraylist. YAY
Three buttons are made, in positions One, Two and Three. YAY
If scene mode is active, the MousePressed function checks to see which scene is active, then which button is pressed, and pushes that scenes's choiceOne to position 0 of the Array. YAY
Fix and simplfy the arraylist. YAY
Get rid of the interface, it overcomplicates things. YAY
Bullets don't work at first? YAY
Akward probelm with next scene - is it lookign at index or button #? YAY
Re-do constructors for scenes so that it can tell what I want just from the construction. YAY
Can't just re-set gameCounter when dead because might then spend time doing stuff. YAY

*/
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "AsteroidsGame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
