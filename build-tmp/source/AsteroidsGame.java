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

//your variable declarations here
//SpaceShip normandy;
Floatable[] thingies;
Star[] nebula;
int thingiesLength;
int starLength;
boolean blink, doneBlinking;

public void setup() 
{
  //your code here
  size(1000, 700);
  thingiesLength = 12;
  starLength = 100;
  //normandy = new SpaceShip();
  thingies = new Floatable[thingiesLength];
  nebula = new Star[starLength];
  thingies[0] = new SpaceShip();
  for (int i = 1; i < thingies.length; i ++) {
    thingies[i] = new Asteroid();
  }
  for (int i = 0; i < starLength; i ++) {
    nebula[i] = new Star();
  }
  
}
public void draw() 
{
  //your code here
  background(0);
  controlAccel();
  for (int i = 0; i < starLength; i ++) {
    nebula[i].show();
  }
  for (int i = 0; i < thingies.length; i ++) {
    thingies[i].move();
    thingies[i].show();
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
      //double checkOnSpeed = Math.sqrt( ( ((float)myDirectionX) * ((float)myDirectionX) ) + ( ((float)myDirectionY) * ((float)myDirectionY) ) );
      //Math.sin(myDirectionY) < 1 || Math.sin(myDirectionY) > -1 
      //(myDirectionX < 2 && myDirectionX > -2) && (myDirectionY > -2 && myDirectionY < 2)
      /* PROBELM: If pass limit, can't go down b/c accel; disabled. SOLUTION: if pass limit, then set *something* lower. */
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

/*class Blinker extends Floater implements Floatable
{
  public Blinker()
  {
    corners = 4;
    xCorners = new int[4];
    yCorners = new int[4];
    xCorners[0] = 1;
    xCorners[1] = 0;
    xCorners[2] = -1;
    xCorners[3] = 0;
    yCorners[0] = 0;
    yCorners[1] = -1;
    yCorners[2] = 0;
    yCorners[3] = 1;

    myColor = color(0, 0, 255);
    myCenterX = -10;
    myCenterY = -10;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
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
    if (blink) {
      myCenterX = ((SpaceShip)thingies[0]).myCenterX;
      myCenterY = ((SpaceShip)thingies[0]).myCenterY;
      myPointDirection = ((SpaceShip)thingies[0]).myPointDirection - 180;
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
  }
}*/

class Asteroid extends Floater implements Floatable
{
  private double myRotSpeed;
  public Asteroid()
  {
    corners = 6;

    xCorners = new int[6];
    yCorners = new int[6];

    xCorners[0] = 16;
    xCorners[1] = 12;
    xCorners[2] = 0;
    xCorners[3] = -24;
    xCorners[4] = -32;
    xCorners[5] = -8;
    yCorners[0] = 12;
    yCorners[1] = -20;
    yCorners[2] = -12;
    yCorners[3] = -24;
    yCorners[4] = 4;
    yCorners[5] = 24;


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


  public void move() {
    rotate( (int)myRotSpeed );
    super.move();
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

boolean aIsPressed = false;
boolean sIsPressed = false;
boolean dIsPressed = false;
boolean wIsPressed = false;
boolean spaceIsPressed = false;



public void keyPressed() {
  if (key == 'a' || key == 'A') {
    aIsPressed = true;
  } else if (key == 'd' || key =='D') {
    dIsPressed = true;
  } else if (key == 'w' || key == 'W') {
    wIsPressed = true;
  } else if (key == 's' || key == 'S') {
    sIsPressed = true;
  } /*else if (keyCode == 32) {
    spaceIsPressed = true;
  }*/else if (key == 32) {
    ((SpaceShip)thingies[0]).setX((int)(Math.random()*width));
    ((SpaceShip)thingies[0]).setY((int)(Math.random()*height));
    ((SpaceShip)thingies[0]).setPointDirection((int)(Math.random()*360));
    ((SpaceShip)thingies[0]).setDirectionX(0);
    ((SpaceShip)thingies[0]).setDirectionY(0);
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

public void controlAccel() {
  if (wIsPressed) {
    ((SpaceShip)thingies[0]).accelerate(0.3f);
  } else if (sIsPressed) {
    ((SpaceShip)thingies[0]).accelerate(-0.3f);
  } else if (aIsPressed) {
    ((SpaceShip)thingies[0]).rotate(-8);
  } else if (dIsPressed) {
    ((SpaceShip)thingies[0]).rotate(8);
  } 
}




//TO Do
/*
Change the shape of the spaceship. Diamond with two wings. YAY!
Make the spaceship have a drive. Ambitious particle drive v.s. color change?
Shape of Asteroids.
Make hyperspace a limited resource later on, a way to escape a crisis. Powerups?
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
