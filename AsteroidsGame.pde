ArrayList <Asteroid> asteroids;
SpaceShip normandy;
Star[] nebula;
int thingiesLength;
int starLength;
boolean blink, doneBlinking;
Blinker[] blinkers;
boolean menu, game, dialouge;
boolean togglePause;
Button startButton, buttonOne, buttonTwo, buttonThree;
ArrayList <Scene> scenes, pastScenes;
ArrayList <Note> notes;
Scene scene1, scene2, scene3, scene4, scene5, scene6, scene7, scene8, scene9, scene10, scene11, scene12, 
scene13, scene14, scene15, scene16, scene17, scene18, scene19, scene20,scene21, scene22, scene23, scene24, scene25,
scene26, scene27, scene28; 
Note note1;
int gameCounter, deathCounter;
//Bullet testB;
ArrayList <Bullet> bullets;
Boolean notSafe;

public void setup() 
{
  
  menu = true;
  togglePause = false;
  //game = true;
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
  
  scene1 = new Scene(1, "Wake up, Eva.", "What's going on?", 2, "Who are you?", 2, "Where am I?", 2);
  scene2 =  new Scene(2, "What do you mean? You don't ... remember?", "[Lie] No, I do. Just nothing from just now.", 3, "I don't remember anything. Should I?", 12, "I'm not talking until you explain where I am.", 17);
  scene3 = new Scene(3, "...", "Uh...are you listening to me?", 4);
  scene4 = new Scene(4, "Yes, yes, everything's fine. Listen carefully. I don't know exactly what's wrong, but you do know what's going on, right?", "Of course.", 5, "What exactly are we talking about?", 6, "Well, no.", 7);
  scene5 = new Scene(5, "Great. Everything's going to be fine. We can talk at length soon, but for now let me walk you through suriving.", "Wait, surviving?", 0, "...", 0);
  scene6 = new Scene(6, "The fact you might be about to die...Eva, please be honest with me, how much do you remember?", "I told you already. I KNOW what's going on.", 10, "I told you already, I rememeber some things, just not the last few years.", 10, "I ... I don't remember anything.", 1);
  scene7 = new Scene(7, "Eva, please be honest with me, how much do you remember?", "I told you already. I KNOW what's going on.", 10, "I told you already, I didn't forgoet much.", 10, "I ... I don't remember anything.", 11);
  scene8 = new Scene(8, "Okay, look, we don't have time for this. You're in a lot of danger. I need you to listen to my instructions if you're going to survive.", "What do you mean, danger?", 9, "What do I have to do?", 0, "I don't trust you.", 9);
  scene9 = new Scene(9, "I don't have time to argue with you! We need to go, NOW!", "...", 0, "All I want is an explination.", 15, "You sound panicky, WHAT'S HAPPENING?", 15);
  scene10 = new Scene(10, "...", "Are you talking to someone?", 8, "What's going on?", 8);
  scene11 = new Scene(11, "... Okay. Listen to me. I don't know what you were trying to do, but you're in a lot of danger and you need to listen to me if you're going to survive.", "Danger?", 10, "Of course", 0);
  scene12 = new Scene(12, "Yes, you bloody well should. ... Look, nevermind. I need you to listen to me. You're in a lot of danger, but I'm going to walk you through it.", "What kind of danger?", 13, "Of course.", 0, "You didn't answer my questions. Who are you?", 13);
  scene13 = new Scene(13, "...", "Are you talking to someone?", 14, "What's going on?", 14);
  scene14 = new Scene(14, "We don't have time for this. I promise I'll answer all your questions in a moment.", "Of course", 0, "I think I deserve to know what's going on.", 15);
  scene15 = new Scene(15, "It wasn't a request. WE DON'T HAVE TIME. I WILL get you out of this, amnesia or not.", "Wait--", 0);
  scene16 = new Scene(16, "Don't worry, you're ok. We'll just try this again.", "What? I thought I was in danger!", 0, "How could you have saved me?", 0, "I really, really want an explination. Now.", 0);
  scene17 = new Scene(17, "You don't...look, Eva, please work with me here. You're in a lot of danger, and my job is to walk you through getting out.", "What kind of danger?", 18, "Should I remember?", 19, "I don't have any reason to trust you.", 14);
  scene18 = new Scene(18, "I'll tell you what you need in a second. Everything else comes after we keep you from dying.", "Okay...what do I have to do?", 0, "I still don't understand where I am.", 15);
  scene19 = new Scene(19, "Yes, you bloody well should remember. I'll tell you everything in a second, just pay attention now.", "Okay.", 0, "Is there ANYONE else I can talk to?", 13);
  scene20 = new Scene(20, 21, "You sure she can't hear us?", "Of course.");
  scene21 = new Scene(21, 22, "...");
  scene22 = new Scene(22, 23, "Please don't beat yourself up over what happened. It wasn't your fault.", "Don't patronize me. Not my FAULT? This, if nothing else, was sure as hell my fault.");
  scene23 = new Scene(23, 24, "I need you to calm down. The worst thing you can do is panic.", "She's damaged. She could have been KILLED! Did you see, at ALL, what just happened? She lost more than immediate memory, she she has no idea where sh--");
  scene24 = new Scene(24, 25, "How do you know she's not just--", "That is not how ANYONE sees the world. She can't even conceptualize her own body, she's looking DOWN from our survaillence - I have no idea what it must feel like, as if she was floating in empty space --");
  scene25 = new Scene(25, 26, "Look at me.", "...", "She is not insane. It's not your fault. And you know what? This might just be what we need.");
  scene26 = new Scene(26, 27, "Look at what she just did! Look at how easy it was for her!", "What? I can't believe you would even -", "So you would weigh her life over everyone else's?");
  scene27 = new Scene(27, 28, "All I need is for you to work with me. Please don't panic.", "Easier said than done!", "The Overisight Council won't know a thing. Give her some idea of the stakes, and I'll keep working on the tech side.");
  scene28 = new Scene(28, 29, "We WILL save the program. And who knows? We might even be able to save her.");
  //scene2 = new Scene(2, 0, "Don't worry, let's just try that again. We have plenty of time.");
  //scene3 = new Scene(3, 1, "Test1 - this is the drop scene for unwritten paths.", "Test2");
  //scene4 = new Scene(4, "... ", "You're not listening to me, are you?", 1);
  //scene5 = new Scene(5, "Okay, interesting. Do you think you're thinking clearly right now?", "What? Of course I am!", 3, "What do you mean, 'thinking clearly'?", 3, "I'm not going to answer you until you tell me what is going on.", 3);
  note1 = new Note(300, 35, 350, 100, "Test test test test test test test test test test test", 100, 20);
  scenes = new ArrayList <Scene>();
  notes = new ArrayList<Note>();
  scenes.add(scene1); scenes.add(scene2); scenes.add(scene3); scenes.add(scene4); scenes.add(scene5); scenes.add(scene6); scenes.add(scene7); scenes.add(scene8); scenes.add(scene9); scenes.add(scene10);
  scenes.add(scene11); scenes.add(scene12); scenes.add(scene13); scenes.add(scene14); scenes.add(scene15); scenes.add(scene16); scenes.add(scene17); scenes.add(scene18); scenes.add(scene19); scenes.add(scene20);
  scenes.add(scene21); scenes.add(scene22); scenes.add(scene23); scenes.add(scene24); scenes.add(scene25); scenes.add(scene26); scenes.add(scene27); scenes.add(scene28);

  /*for (int i = 0; i < 1; i ++) { //Initialize objects. ??IF THIS BREAKS< PUT IT BACK TO 1 (int i = ...)
     asteroids.add( new Asteroid() );
  }*/
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
  
  //System.out.println( scenes.get(0).getTextOne() );

  if (game) { // GAME CODE
    background(0); // Showing game elements
    keyActions();
    System.out.println(asteroids.size());
    if (asteroids.size() == 0) {
      replaceScene(20);
      game = false; dialouge = true;
    }

    

    for (int i = 0; i < starLength; i ++) {
      nebula[i].show();
    }
    normandy.move();
    normandy.show();
    for (int i = 0; i < bullets.size(); i ++) {
      bullets.get(i).show();
      bullets.get(i).move();
    }


    outer:
    for (int i = 0; i < asteroids.size(); i ++) {
      for (int j = 0; j < bullets.size(); j ++) {
        float checkDestruction = dist( bullets.get(j).getX(), bullets.get(j).getY(), asteroids.get(i).getX(), asteroids.get(i).getY());
        if (checkDestruction < 25*asteroids.get(i).getSizeMult() ) {
          if (asteroids.get(i).getSizeMult() > 1)  {
            Asteroid bob1 = new Asteroid(  asteroids.get(i).getX(), asteroids.get(i).getY(), asteroids.get(i).getSizeMult() -1 );
            Asteroid bob2 = new Asteroid(  asteroids.get(i).getX(), asteroids.get(i).getY(), asteroids.get(i).getSizeMult() -1 );
            asteroids.add(bob1); asteroids.add(bob2);
          }
          
          /*if (asteroids.size() == 1) {
            scenes.add(0, scenes.remove(20));
            game = false; dialouge = true;
          }*/

          asteroids.remove(asteroids.get(i));
          bullets.remove(bullets.get(j));

          break outer;
        }
      }
    }
    if (asteroidSpaceShipCollision()) {
        game = false; dialouge = true; 
        deathActions();
    }  
    for (int i = 0; i < asteroids.size(); i ++) {
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
    if (blink && (Math.random() > .9)   ) {
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
    if(myCenterX >width) {     
      myCenterX = 0;    
    } else if (myCenterX<0) {     
      myCenterX = width;    
    }    
    if(myCenterY >height) {    
      myCenterY = 0;    
    }  else if (myCenterY < 0) {     
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
    sizeMult = (int)(Math.random()*5 + 1);
    corners = 6;

    int[] setXArray = {sizeMult*16, sizeMult*12, sizeMult*0, sizeMult*-24, sizeMult*-32, sizeMult*-8};
    int[] setYArray = {sizeMult*12, sizeMult*-20, sizeMult*-12, sizeMult*-24, sizeMult*4, sizeMult*24};

    xCorners = setXArray;
    yCorners = setYArray;

    myColor = color(0, 0, 255, 100);
    myCenterX = 0;//Math.random()*width;
    myCenterY = Math.random()*height;
    myDirectionX = (Math.random()*3)-1.5;
    myDirectionY = (Math.random()*3)-1.5;
    myPointDirection = Math.random()*360;

    myRotSpeed = (Math.random()*6)-3;
  }
  public Asteroid(double x, double y, int siz) {
    sizeMult = siz;
    corners = 6;

    int[] setXArray = {sizeMult*16, sizeMult*12, sizeMult*0, sizeMult*-24, sizeMult*-32, sizeMult*-8};
    int[] setYArray = {sizeMult*12, sizeMult*-20, sizeMult*-12, sizeMult*-24, sizeMult*4, sizeMult*24};

    xCorners = setXArray;
    yCorners = setYArray;

    myColor = color(0, 0, 255, 100);
    myCenterX = x;
    myCenterY = y;
    myDirectionX = (Math.random()*3)-1.5;
    myDirectionY = (Math.random()*3)-1.5;
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
      textSize(8);
      text("USER AN-71-14", 100, 80);
      textSize(40);
      text(myTextOne, 100, 100, 800, 400);
    } else if (textBoxNum == 2) {
      textSize(8);
      text("USER CL-42-12", 100, 80);
      textSize(40);
      text(myTextOne, 100, 100, 800, 400);
      //fill(160, 50, 168);
      textSize(8);
      text("USER AN-71-14", 100, 280);
      textSize(40);
      text(myTextTwo, 100, 300, 800, 400);
    } else if (textBoxNum == 3) {
      textSize(8);
      text("USER CL-42-12", 100, 80);
      textSize(40);
      text(myTextOne, 100, 100, 800, 400);
      //fill(0, 0, 255);
      textSize(8);
      text("USER AN-71-14", 100, 280);
      textSize(40);
      text(myTextTwo, 100, 300, 800, 400);
      //fill(0, 255, 0);
      textSize(8);
      text("USER CL-42-12", 100, 480);
      textSize(40);
      text(myTextThree, 100, 500, 800, 400);
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
    
    
    /*for (int i = 0; i < scenes.size(); i ++) {
      if (scenes.get(i).getIndex() == chc) {
        scenes.add(0, scenes.remove(i));
      }
    }*/
    replaceScene(chc);
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
    normandy.accelerate(0.3);
    blink = true;
  } else if (sIsPressed) {
    normandy.accelerate(0.3);
    blink = true;
  } else if (aIsPressed) {
    normandy.rotate(-8);
  } else if (dIsPressed) {
    normandy.rotate(8);
  } else if (wIsPressed && aIsPressed) {
    normandy.accelerate(0.3);
    blink = true;
    normandy.rotate(-8);
  } else if (wIsPressed && dIsPressed) {
    normandy.accelerate(0.3);
    blink = true;
    normandy.rotate(8);
  } else if (sIsPressed && aIsPressed) {
    normandy.accelerate(0.3);
    blink = true;
    normandy.rotate(-8);
  } else if (sIsPressed && dIsPressed) {
    normandy.accelerate(0.3);
    blink = true;
    normandy.rotate(8);
  } else if (spaceIsPressed) {
    togglePause = !togglePause;
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
/*
public boolean asteroidSpaceShipCollision(int i) {
  float checkCollision = dist( normandy.getX(), normandy.getY(), asteroids.get(i).getX(), asteroids.get(i).getY());
      if (checkCollision < (25*asteroids.get(i).getSizeMult()) && gameCounter > 10) {
        return true;
      }
  return false;
}
*/

public boolean asteroidSpaceShipCollision(int dis) {
  for (int i = 0; i < asteroids.size(); i ++) {
    float checkCollision = dist( normandy.getX(), normandy.getY(), asteroids.get(i).getX(), asteroids.get(i).getY());
    if (checkCollision < (dis*asteroids.get(i).getSizeMult()) && gameCounter > 10) {
      return true;
    }
  }
  return false;
}

public boolean asteroidSpaceShipCollision() {
  for (int i = 0; i < asteroids.size(); i ++) {
    float checkCollision = dist( normandy.getX(), normandy.getY(), asteroids.get(i).getX(), asteroids.get(i).getY());
    if (checkCollision < (25*asteroids.get(i).getSizeMult()) && gameCounter > 10) {
      return true;
    }
  }
  return false;
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
  gameSetup();
  if (deathCounter == 0) {
    for (int i = 0; i < scenes.size(); i ++) {
      if (scenes.get(i).getIndex() == 16) {
        scenes.add(0, scenes.remove(i));
      }
    }
  } else {
    for (int i = 0; i < scenes.size(); i ++) {
      if (scenes.get(i).getIndex() == 16) {
        scenes.add(0, scenes.remove(i));
      }
    }
  }

  // Add more based on what scene you go to after each death.
  deathCounter++;
}

public void gameSetup() {
  //Find most recent scene, and from that scene extrapolate conditions on whcih level you're going into. 
  
  /*resetGame();
  notSafe = true;
  while (notSafe) {
    if (asteroidSpaceShipCollision(1000)) {
      resetGame();
    } else {
      notSafe = false;
    }
  }*/    
  /*for (int i = asteroids.size(); i > 0; i --) {
    asteroids.remove(0);
  }*/
  for (int i = 0; i < 2; i ++) {
    asteroids.add( new Asteroid() );
  }
}

public void replaceScene(int chc) {
  for (int i = 0; i < scenes.size(); i ++) {
    if (scenes.get(i).getIndex() == chc) {
        scenes.add(0, scenes.remove(i));
      }
  }
}

//TO DO
/*

Choices effect final dialouge. 

Function upon all asteroids gone that triggers congrats scene.

Implement pause scene (noLoop when turned on) for pause and instructions. 

Finish early dialouge YAY

Names/labels

Scene ending so far. 







Set up second array of "passed scenes"

2 menu buttons, one for story, one straight to game


Make sure the simultanious key presses are dealt with. 
Shape of Asteroids - right now they mess up collision. Farther collision distance.


Scene-to-scene transition


Only allow scene change after a pause, to stop double clicks?

Fix asteroid collision. 

Make it so game never drops you onto asteroids. Problem - can the loop check unless the game started?

ASsteroids initialize along sides, ship also. 



LONG - TERM
Figure out people's names in convo so that they can speak in different orders. 
Special larger bukllets? Laser? Other firing methods?
Simplify everything into component functions. 
Make hyperspace a limited resource later on, a way to escape a crisis. Powerups?
Hyperspace doesn't drop you on an asteroid. 
A version where shooting doubles number of asteroids, but not necessarily smaller. 
Smaller text fits.

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
Asteroid Size YAY
*/