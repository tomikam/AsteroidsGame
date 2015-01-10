ArrayList <Asteroid> asteroids;
SpaceShip normandy;
Star[] nebula;
int thingiesLength;
int starLength;
boolean blink, doneBlinking;
Blinker[] blinkers;
boolean menu, game, dialouge;
boolean togglePause, firstBuild;
Button startButton, buttonOne, buttonTwo, buttonThree;
ArrayList <Scene> /*scenes,*/ pastScenes;
Scene[] scenes;
Note[] notes;
ArrayList <Note> pastNotes;
int gameCounter, deathCounter, noteCounter, currentMission;
ArrayList <Bullet> bullets;




public void setup() 
{
  size(1000, 700);

  menu = true;
  togglePause = false;
  gameCounter = 0;
  noteCounter = 0;
  currentMission = 0;
  firstBuild = true;
  //game = true;
  
  starLength = 100;//Declare Arrays
  bullets = new ArrayList <Bullet>();
  blinkers = new Blinker[10];
  asteroids = new ArrayList <Asteroid>();
  nebula = new Star[starLength];
  normandy = new SpaceShip();

  pastScenes = new ArrayList <Scene>();
  pastNotes = new ArrayList<Note>();
  scenes = new Scene[48];
  notes = new Note[9];
  /*for (int i = 0; i < 30; i ++) { //Add Scenes
      scenes.add(new Scene());
  }*/
  scenes[0] = new Scene();
  scenes[1] = new Scene(1, "Wake up, Eva.", "What's going on?", 2, "Who are you?", 2, "Where am I?", 2);
  scenes[2] = new Scene(2, "What do you mean? You don't ... remember?", "[Lie] No, I do. Just nothing from just now.", 3, "I don't remember anything. Should I?", 12, "I'm not talking until you explain where I am.", 17); 
  scenes[3] = new Scene(3, "...", "Uh...are you listening to me?", 4);  
  scenes[4] = new Scene(4, "Yes, yes, everything's fine. Listen carefully. I don't know exactly what's wrong, but you do know what's going on, right?", "Of course.", 5, "What exactly are we talking about?", 6, "Well, no.", 7);
  scenes[5] = new Scene(5, "Great. Everything's going to be fine. We can talk at length soon, but for now let me walk you through suriving.", "Wait, surviving?", 0, "...", 0);
  scenes[6] = new Scene(6, "The fact you might be about to die...Eva, please be honest with me, how much do you remember?", "I told you already. I KNOW what's going on.", 10, "I told you already, I rememeber some things, just not the last few years.", 10, "I ... I don't remember anything.", 1);
  scenes[7] = new Scene(7, "Eva, please be honest with me, how much do you remember?", "I told you already. I KNOW what's going on.", 10, "I told you already, I didn't forgoet much.", 10, "I ... I don't remember anything.", 11);  
  scenes[8] = new Scene(8, "Okay, look, we don't have time for this. You're in a lot of danger. I need you to listen to my instructions if you're going to survive.", "What do you mean, danger?", 9, "What do I have to do?", 0, "I don't trust you.", 9);
  scenes[9] = new Scene(9, "I don't have time to argue with you! We need to go, NOW!", "...", 0, "All I want is an explination.", 15, "You sound panicky, WHAT'S HAPPENING?", 15); 
  scenes[10] = new Scene(10, "...", "Are you talking to someone?", 8, "What's going on?", 8);
  scenes[11] = new Scene(11, "... Okay. Listen to me. I don't know what you were trying to do, but you're in a lot of danger and you need to listen to me if you're going to survive.", "Danger?", 10, "Of course!", 0); 
  scenes[12] = new Scene(12, "Yes, you bloody well should. ... Look, nevermind. I need you to listen to me. You're in a lot of danger, but I'm going to walk you through it.", "What kind of danger?", 13, "Of course.", 0, "You didn't answer my questions. Who are you?", 13);
  scenes[13] = new Scene(13, "...", "Are you talking to someone?", 14, "What's going on?", 14);
  scenes[14] = new Scene(14, "We don't have time for this. I promise I'll answer all your questions in a moment.", "Of course", 0, "I think I deserve to know what's going on.", 15);
  scenes[15] = new Scene(15, "It wasn't a request. WE DON'T HAVE TIME. I WILL get you out of this, amnesia or not.", "Wait--", 0); 
  scenes[16] = new Scene(16, "Don't worry, you're ok. We'll just try this again.", "What? I thought I was in danger!", 0, "How could you have saved me?", 0, "I really, really want an explination. Now.", 0);
  scenes[17] = new Scene(17, "You don't...look, Eva, please work with me here. You're in a lot of danger, and my job is to walk you through getting out.", "What kind of danger?", 18, "Should I remember?", 19, "I don't have any reason to trust you.", 14);
  scenes[18] = new Scene(18, "I'll tell you what you need in a second. Everything else comes after we keep you from dying.", "Okay...what do I have to do?", 0, "I still don't understand where I am.", 15);
  scenes[19] = new Scene(19, "Yes, you bloody well should remember. I'll tell you everything in a second, just pay attention now.", "Okay.", 0, "Is there ANYONE else I can talk to?", 13); 
  scenes[20] = new Scene(20, 21, "You sure she can't hear us?", "Of course.", 117);
  scenes[21] = new Scene(21, 22, "...");
  scenes[22] = new Scene(22, 23, "Please don't beat yourself up over what happened. It wasn't your fault.", "Don't patronize me. Not my FAULT? This, if nothing else, was sure as hell my fault.", 117);
  scenes[23] = new Scene(23, 24, "I need you to calm down. The worst thing you can do is panic.", "She's damaged. She could have been KILLED! Did you see, at ALL, what just happened? She lost more than immediate memory, she she has no idea where sh--", 117);
  scenes[24] = new Scene(24, 25, "How do you know she's not just--", "That is not how ANYONE sees the world. She can't even conceptualize her own body, she's looking DOWN from our survaillence - as if she was just ...floating --", 117);
  scenes[25] = new Scene(25, 26, "Look at me.", "...", "She is not insane. It's not your fault. And you know what? This might just be what we need."); 
  scenes[26] = new Scene(26, 27, "Look at what she just did! Look at how easy it was for her!", "What? I can't believe you would even -", "So you would weigh her life over everyone else's?"); 
  scenes[27] = new Scene(27, 28, "All I need is for you to work with me. Please don't panic.", "Easier said than done!", "The Overisight Council won't know a thing. Give her some idea of the stakes, and I'll keep working on the tech side.");
  scenes[28] = new Scene(28, 29, "We WILL save the program. We WILL save the Union. And who knows? We might even be able to save her.");
  scenes[29] = new FinalScene(29); 
  scenes[30] = new Scene(30, "...", "Why won't you answer?", 0, "Isn't this your job?", 0, "Have you considered how terrifying this is?", 0); 
  scenes[31] = new Scene(31, "Do you see why we were in a hurry? You were overwhelmed!", "Okay, fine. I'm sorry.", 32, "Maybe it would have been this way anyway.", 32, "I thought I was supposed to be dead!", 32);
  scenes[32] = new Scene(32, "We just managed to pull you out of danger. I'll tell you all about it the moment we have time to talk.", "Got it. I'm ready.", 0, "And what if I keep killing myself?", 0);
  scenes[33] = new Scene(33, "Okay, thank goodness that's over. Now I'm happy to answer questions. I'm hoping it'll even jog your memory.", "Where am I and what's going on?", 34, "Who are you?", 40, "I already told you, I remember!", 50);
  scenes[34] = new Scene(34, 35, "That's a long story. You're on the far edge of inhabited space in a single-seater spacecraft. A few hours ago you sent in a distress call by the Faster-than-Light ansible. You said that you had discovered something dangerous and then dropped out of contact.");
  scenes[35] = new Scene(35, 36, "It was vauge and kind of mysterious, but you seemed threatened enough to justify engaging a whole network of survailence probes. Your ship was just discovered, floating in a dangerous asteroid field. At first, we couldn't contact you at all.");
  scenes[36] = new Scene(36, "We just managed to wake you up.", "So am I still there?", 37, "So now what?", 38, "So where are YOU?", 47);
  scenes[37] = new Scene(37, 39, "No. Your ship is equipped with a Faster-than-Light skip drive. Although we can't fly your ship from a distance, we activated your skip drive as soon as you were out of danger.");
  scenes[38] = new Scene(38, 41, "We still don't know what's wrong with your mind and we probably won't be able to until we get you back to medical help. In the meanwhile, just to be safe, we're directing the basic functions of your ship remotely.");
  scenes[39] = new Scene(39, 40, "For now, we're trying to get you, one skip at a time, towards more populated space. In the process you might have to defend your ship against local debris until your drive charges.");
  scenes[40] = new Scene(40, "Any other questions?", "No, that's enough. Thank you.", 50, "So where are YOU?", 47, "What could have hurt my memory?", 50);
  scenes[41] = new Scene(41, "We're going from one Skip Point to another and getting you towards more populated space.", "Wait. You can fly my ship?", 42, "So where are you, exactly?", 43);
  scenes[42] = new Scene(42, "Don't worry. Even with the ansible, time lag makes moment-to-moment control impossible, which is why we need you to defend your ship while the drive charges.", "Ok, got it. Thank you.", 50, "Wait. So there are asteroids at EVERY skip point?", 43);
  scenes[43] = new Scene(43, "Give me a second. This is kind of tough to explain. Well...basically skip points depend on some minimal mass in the area. They aren't just in empty space.", "Oh, ok. That makes sense.", 50, "But why? And couldn't my ship be enough?", 44);
  scenes[44] = new Scene(44, "I said already I'm not a physics person. You need some significant starting mass to jump-start opening a wormhole, and it's not safe for it to be your ship in case the wormhole goes out of control.", "You just contradicted yourself. If the skip drive is creating a wormhole from mass, then how did we skip when I destoryed all the asteroids?", 45);
  scenes[45] = new Scene(45, "Because the mass projection wasn't--look. PLEASE ask someone else when you have a moment. I'm a rescue opererator, not a physicist.", "Fine.", 50, "Do you see why I don't trust you?", 46, "I just feel like I would remember somethign like this.", 46);
  scenes[46] = new Scene(46, "It's not a question of trust. You'll see in a moment that you've moved faster than normal space travel could explain.", "Fine. I'll guess we'll see.", 50);
  scenes[47] = new Scene(47, "What's a skip drive?", "What?", 48, "Are you testing me?", 49, "It...lets you travel faster than light?", 50);
  pastScenes.add(scenes[1]);
  
  notes[0] = new Note("Test test test test test test test test test test test", 0, 0);
  notes[1] = new Note("Okay, let me see. Adam, can you prepare the contingencies?", 1, 2);
  notes[2] = new Note("Sorry. Now listen carefully.", 2, 3);
  notes[3] = new Note("Now that you're alert, you should be fine. I'll help if something goes wrong.", 3, 4);
  notes[4] = new Note("The ship in the middle is you. [Move with WASD]", 4, 5);  
  notes[5] = new Note("The object in the distance is an asteroid. Touch it and you will die.", 5, 6);
  notes[6] = new Note("Shoot a large asteroid and it will break apart. [Press space to fire].", 6, 7);
  notes[7] = new Note("We'll talk more when you're free of immediate danger. Good luck!", 7, 0);
  notes[8] = new Note("Watch out!", 8, 0); //Remember to ++ notes!

  pastNotes.add(notes[1]);

  for (int i = 0; i < starLength; i ++) { //Initialize floaters and buttons
    nebula[i] = new Star();
  }
  for (int i = 0; i < 10; i ++) {
    blinkers[i] = new Blinker();
  }
  startButton = new Button(500, 400, 400, 100, "Start");
 	
  buttonOne = new ClearButton(75, 335, 850, 100);
  buttonTwo = new ClearButton(75, 460, 850, 100);
  buttonThree = new ClearButton(75, 580, 850, 100);
}

public void draw() {
  if (game) { // GAME CODE
    background(0); // Showing game elements
    if (!togglePause) {keyActions();}
  
    if (asteroids.size() == 0) { //Jumps to next scene if Asteroids eliminated. 
      replaceScene(20);
      game = false; dialouge = true; firstBuild = true;
      //currentMission ++; //Going to move this later. 
    }

    for (int i = 0; i < starLength; i ++) { //Showing floaters. 
      nebula[i].show();
    }
    if (!togglePause) {normandy.move();}
    normandy.show();
    for (int i = 0; i < bullets.size(); i ++) {
      bullets.get(i).show();
      if (!togglePause) {bullets.get(i).move();}
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
      if (!togglePause) {asteroids.get(i).move();}
      asteroids.get(i).show();
    }
    for (int i = 0; i < blinkers.length; i ++) {
      if (!togglePause) {blinkers[i].move();}
      blinkers[i].show();
    }

    if (togglePause) {
      fill(0, 0, 255, 60);
      rect(0, 0, width, height);
      textSize(40);
      if (firstBuild) {
        pauseActions();
        pastNotes.get(0).show();
        fill(0, 0, 255, 255);
        textSize(10);
        text("Click to continue.", width/2 - 80, height*5/6 + 40);
      } else { 
        fill(0, 0, 255, 255);
        text("GAME IS PAUSED", width/3, height*5/6);
        textSize(10);
        text("Press P or 'Next' to continue.", width/2 - 80, height*5/6 + 40);
      }
    }


    gameCounter ++; //Advances a counter each turn. 
    
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
    pastScenes.get(0).show();
    if (pastScenes.get(0).getAnswerNum() == 1 ) {
      ((ClearButton)(buttonOne)).show();
    } else if ( pastScenes.get(0).getAnswerNum() == 2  ) {
      ((ClearButton)(buttonOne)).show();
      ((ClearButton)(buttonTwo)).show();
    } else if ( pastScenes.get(0).getAnswerNum() == 3 ) {
      ((ClearButton)(buttonOne)).show();
      ((ClearButton)(buttonTwo)).show();
      ((ClearButton)(buttonThree)).show();
    }
  }
}
 
class SpaceShip extends Floater 
{   
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

    public void accelerate(float accelMod) { //If speed is over limit, doesn't accelerate and drops speed to one less than limit. 
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

class Blinker extends Floater 
{
  int timeCounter;
  public Blinker()
  {
    corners = 4;

    int[] setXArray = {3, 0, -3, 0};
    int[] setYArray = {0, -3, 0, 3};
    xCorners = setXArray;
    yCorners = setYArray;

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
    if (blink && (Math.random() > .9)   ) { //When created, blinkers shoot off in the opposite direction. 
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
    if(myCenterX >width) { //Hides if go offscreen. 
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

    if (timeCounter < (int)plumeLength*4) { //Onyl shows if the timecounter hasn't run out yet. 
      super.show();
    }
  }
}

class Asteroid extends Floater 
{
  private double myRotSpeed;
  private int sizeMult;
  public Asteroid() //Creates an arbitrary asteroid. 
  {
    sizeMult = (int)(Math.random()*5 + 1);
    corners = 6;

    int[] setXArray = {sizeMult*16, sizeMult*12, sizeMult*0, sizeMult*-24, sizeMult*-32, sizeMult*-8};
    int[] setYArray = {sizeMult*12, sizeMult*-20, sizeMult*-12, sizeMult*-24, sizeMult*4, sizeMult*24};

    xCorners = setXArray;
    yCorners = setYArray;

    myColor = color(0, 0, 255, 100);
    myCenterX = 0;
    myCenterY = Math.random()*height;
    myDirectionX = (Math.random()*3)-1.5;
    myDirectionY = (Math.random()*3)-1.5;
    myPointDirection = Math.random()*360;

    myRotSpeed = (Math.random()*6)-3;
  }
  public Asteroid(double x, double y, int siz) { //Creates a specific asteroid.
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


  public void move() { //Same move but with rotate. 
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

    if (myCenterX >width || myCenterX<0 || myCenterY >height || myCenterY < 0) { //If it goes offscreen, remove it from the arraylist. 
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

abstract class TextBoundary //Basic aspects of a button or note. 
{
  protected int myX, myY, myWidth, myHeight, myRightBound, myBottomBound;
  protected String myText;
  public TextBoundary() {
    myX = 0; myY = 0; myWidth = 0; myHeight = 0; myText = "test";
  }
  public TextBoundary(int x, int y, int wid, int hgt) {
    myX = x; myY = y; myWidth = wid; myHeight = hgt; myText = "Delete";
  }
  public TextBoundary(int x, int y, int wid, int hgt, String txt) {
    myX = x; myY = y; myWidth = wid; myHeight = hgt; myText = txt;
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
    myX = x; myY = y; myWidth = wid; myHeight = hgt; myText = txt;
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

class ClearButton extends Button{ //Like a button but invisible b/s text and mouseover. 
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

public class Note extends TextBoundary //On-screen. Triggered through Scripts. 
{
  int myIndex, triggeredNote; 
  public Note() {}
  public Note (int x, int y, int wid, int hgt, String txt, int idx, int trig) {
    myX = x;
    myY = y;
    myWidth = wid;
    myHeight = hgt;
    myText = txt;
    myIndex = idx;
    triggeredNote = trig;
  }
  public Note(String txt, int idx, int trig) { //300, 35, 350, 100,
    myX = 300; myY = 35; myWidth = 350; myHeight = 100;
    myText = txt; myIndex = idx; triggeredNote = trig;
  }
  public void triggerNextNote() {
    if (triggeredNote == 0) {
      togglePause = false;
      firstBuild = false;
    } else {
      pastNotes.add(0, notes[triggeredNote]);
      noteCounter ++;
    }
    
  }
  public void show() {
    /*if (gameCounter > triggerPoint) {*/
      fill(0, 0, 255);
      noStroke();
      rect(myX, myY, myWidth, myHeight);
      fill(0);
      stroke(0);
      textSize(20);
      text(myText, myX + 10, myY + 10, myWidth - 10, myHeight - 10);
    /*}*/
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
  public Scene(int index, int chc1, String txt1, String txt2, int rNum) {
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
      textSize(8);
      text("USER AN-71-14", 100, 280);
      textSize(40);
      text(myTextTwo, 100, 300, 800, 400);
    } else if (textBoxNum == 3) {
      textSize(8);
      text("USER CL-42-12", 100, 80);
      textSize(40);
      text(myTextOne, 100, 100, 800, 400);
      textSize(8);
      text("USER AN-71-14", 100, 280);
      textSize(40);
      text(myTextTwo, 100, 300, 800, 400);
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
      text(choiceOneText, 100, 400);
      text(choiceTwoText, 100, 525);
      text(choiceThreeText, 100, 650);
    }
  }

  public void triggerNextScene() { //Reads which button was pressed, takes information on where to go from constructor and thus triggers replaceScene

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
      game = true; dialouge = false; gameSetup();
    } else {
      replaceScene(chc);
    }
  }
}

public class FinalScene extends Scene //Scene but with slightly different draw mode, used only once. 
{
	FinalScene(int indx) {
		myIndex = indx;
	}
	public void show() {
		background(0);
    textSize(60);
    fill(0, 0, 255);
    text("TO BE CONTINUED SOON ...", 100, 100, width - 200, height);
	}
}

boolean aIsPressed = false;
boolean sIsPressed = false;
boolean dIsPressed = false;
boolean wIsPressed = false;
boolean spaceIsPressed = false;
boolean pIsPressed = false;

int shotCounter = -10;

public void keyPressed() {
  if (key == 'a' || key == 'A') {aIsPressed = true;}
  if (key == 'd' || key =='D') {dIsPressed = true;}
  if (key == 'w' || key == 'W') {wIsPressed = true;} 
  if (key == 's' || key == 'S') {sIsPressed = true;}
  if (key == 'q' || key == 'Q') { //Hyperspace
    normandy.setX((int)(Math.random()*width));
    normandy.setY((int)(Math.random()*height));
    normandy.setPointDirection((int)(Math.random()*360));
    normandy.setDirectionX(0);
    normandy.setDirectionY(0);
  } 
  if (key == 32) {
    if (shotCounter + 10 < gameCounter) {
      bullets.add(new Bullet(normandy));
      shotCounter = gameCounter;
    }
  }
}

public void keyReleased() {
  if (key == 'a' || key == 'A') {aIsPressed = false;}
  if (key == 'd' || key == 'D') {dIsPressed = false;} 
  if (key == 'w' || key == 'W') {wIsPressed = false;} 
  if (key == 's' || key == 'S') {sIsPressed = false;} 
  if (key == 'p' || key == 'P') {togglePause = !togglePause;}
  if (keyCode == 32) {spaceIsPressed = false;}
}

public void keyActions() {  // S is also set to do forwards. 
  if (wIsPressed) {
    normandy.accelerate(0.3);
    blink = true;
  } 
  if (sIsPressed) {
    normandy.accelerate(0.3);
    blink = true;
  } 
  if (aIsPressed) {
    normandy.rotate(-8);
  } 
  if (dIsPressed) {
    normandy.rotate(8);
  } 
  /*if (pIsPressed) {
    togglePause = !togglePause;
  }*/

}

public void mousePressed() {
  if (menu && checkIfInside(startButton) ) { //If it's the menu, goes straight to the next scene. 
    menu = false;
    dialouge = true;
  } else if (dialouge) {  
    pastScenes.get(0).triggerNextScene(); //If it's the scenes, runs current scenes's triggerNextScene
  } else if (game && togglePause) {
    pastNotes.get(0).triggerNextNote();
  }
}

public boolean checkIfInside(TextBoundary b) { //Checks if mouse is inside a given button. 
  if (mouseX > b.getX() && mouseX < ( b.getX() + b.getWidth() ) && mouseY > b.getY() && mouseY < (b.getY() + b.getHeight() ) ) {
    return true;
  } else {
    return false;
  }
}

public boolean asteroidSpaceShipCollision(int dis) { //Checks to see if spaceship is within x distance of an asteroid. 
  for (int i = 0; i < asteroids.size(); i ++) {
    float checkCollision = dist( normandy.getX(), normandy.getY(), asteroids.get(i).getX(), asteroids.get(i).getY());
    if (checkCollision < (dis*asteroids.get(i).getSizeMult()) && gameCounter > 10) {
      return true;
    }
  }
  return false;
}

public boolean asteroidSpaceShipCollision() { //Same, but x = 25
  for (int i = 0; i < asteroids.size(); i ++) {
    float checkCollision = dist( normandy.getX(), normandy.getY(), asteroids.get(i).getX(), asteroids.get(i).getY());
    if (checkCollision < (25*asteroids.get(i).getSizeMult()) && gameCounter > 10) {
      return true;
    }
  }
  return false;
}

public void deathActions() { //Enters new scenes when player dies. Depends on which death it is. 
  firstBuild = false;
  int idxCheck = pastScenes.get(0).getIndex();
  if (idxCheck == 15 || idxCheck == 9) {
    replaceScene(31);
  } else {
    if (deathCounter == 1) {
      replaceScene(30);
    } else {
      replaceScene(16);
    }
  }

  // Add more based on what scene you go to after each death.
  // Add based on most recent scene. 
  deathCounter++;
}

public void gameSetup() { //Sets up game objects. 
  if (firstBuild) {
    togglePause = true;
    noteCounter = 0;
  } 
  normandy.setX(width/2);
  normandy.setY(height/2);
  normandy.setDirectionX(0);
  normandy.setDirectionY(0);
  normandy.setPointDirection(0);
  gameCounter = 0;
  shotCounter = -10;
  for (int i = asteroids.size(); i > 0; i --) {
    asteroids.remove(0);
  }
  missionIncrement(); //This only works if there is always a scene between death and new action. 
  if (currentMission == 1) {
    for (int i = 0; i < 7; i ++) {asteroids.add(new Asteroid());}
  }
  if (currentMission == 2) {
    for (int i = 0; i < 1; i ++) {
      asteroids.add( new Asteroid() );
    }
  }
}

public void replaceScene(int chc) { //Searches through scenes, finds the one needed, deletes it from it's current position and adds it to the scene arraylist.
  for (int i = 0; i < scenes.length; i ++) {
    if (scenes[i].getIndex() == chc) {
        pastScenes.add(0, scenes[i]);
      }
  }
}

public boolean checkLastScene(int indx) {
  if (pastScenes.get(0).getIndex() == indx) {
    return true;
  }
  return false;
}

public int checkPastScene(int indx) {
  for (int i = 0; i < pastScenes.size(); i ++) {
    if (pastScenes.get(i).getIndex() == indx) {
      return pastScenes.get(i).getIndex();
    }
  }
  return 0;
}

public void pauseActions() {
	//Lots of triggers, lots of events.
  int idxCheck = pastScenes.get(0).getIndex(); 
  if ((idxCheck == 15 || idxCheck == 9 || idxCheck == 32) && noteCounter == 0 ) {
    pastNotes.add(0, notes[8]);
  } else if (noteCounter == 0) {
    pastNotes.add(0, notes[1]);
  }
}

public void missionIncrement() {
  if (checkLastScene(15) || checkLastScene(9)) {
    currentMission = 1;
  }
  if (checkLastScene(5) || checkLastScene(8) || checkLastScene(11) || checkLastScene(12) || checkLastScene(14) || checkLastScene(18) || checkLastScene(19)){
    currentMission = 2;
  }
}

//TO DO
/*

Re-do so basic exposition first, then CAN answer questions but also CAN move right along. 

Question-and-answer session with Maria. 

How do you change which scene gets triggered by an action dependant on past events? Could it be an addition to triggerNextScene? triggerNextScene checks to see if there's anything else 

Level Select. 

2 menu buttons, one for story, one straight to game

Scene-to-scene transition



Clean-up

ASK MR. SIMON
Is there some other way to deal with extra methods besides adding a pointless parameter? Can Java tell the differance in order of parameters?

LONG - TERM
Get rid of indexes entierly and just use their place in the array. 
Figure out people's names in convo so that they can speak in different orders. 
Special larger bullets? Laser? Other firing methods?
Simplify everything into component functions. 
Make hyperspace a limited resource later on, a way to escape a crisis. Powerups?
Hyperspace doesn't drop you on an asteroid. 
A version where shooting doubles number of asteroids, but not necessarily smaller. 
Smaller text fits.
Level select. 
Larger maps.
Item pickups also have an associated eventTriggered function and can call pauses and events. How 
Notes have back and forwards buttons. 
Fun things:
  "Defense Drones" 
  "Obstacles"
  "Radiation fields" - download. 
Chapter select in main screen. Choices?

MAYBE NOT NEEDED?
Only allow scene change after a pause, to stop double clicks?
Shape of Asteroids - right now they mess up collision. Farther collision distance.

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
Finish early dialouge YAY
Names/labels YAY
Scene ending so far. YAY
Function upon all asteroids gone that triggers congrats scene. YAY
Make sure the simultanious key presses are dealt with. YAY
Set up second array of "passed scenes" YAY
Bugfix the last scene. YAY
Better default note constructor. YAY
Choices effect final dialouge. YAY
  Notes have next and last buttons.
  Notes also have indexes. YAY
  noteCounter says which note this is so far in convo. Mouseclicked inside buttons adds to it. Reset in resetGame. YAY
  If deathcounter == 0 in resetGame, also adds notes. YAY
  Gamesetup has pause as default. YAY
Index check function returns true if that's the most recent scene. YAY
Implement pause scene (noLoop when turned on) for pause and instructions. Scripting works how? Possibly stops Asteroid motion, doesn't build them, a massive if-then tree which buildGame taps into to initialize certain variables, and then there's a function that controls all of this, dep. on variables and gameCounter
A function that searches through the entire pastScenes to see if something is there, better for deathActions. YAY


WHAT DO WE ACTUALLY NEED HERE?

Notes display, and player action can jump them forwards and backwards. 
A note displays based on which scene is in 0 and where noteCounter is along. 

So...I could do the exact same thing as there is for scenes, except...sometimes notes also trigger scripted events. 
  So then pauseActions could say: if currentNote == x, do y.

*/