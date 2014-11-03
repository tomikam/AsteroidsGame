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
  thingiesLength = 1;
  starLength = 100;
  //normandy = new SpaceShip();
  thingies = new Floatable[thingiesLength];
  nebula = new Star[starLength];
  thingies[0] = new SpaceShip();
  for (int i = 0; i < starLength; i ++) {
    nebula[i] = new Star();
  }
  
}
public void draw() 
{
  //your code here
  background(0);
  //normandy.move();
  //normandy.show();
  thingies[0].move();
  thingies[0].show();
  for (int i = 0; i < starLength; i ++) {
    nebula[i].show();
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
      corners = 8;
      xCorners = new int[8];
      yCorners = new int[8];


      xCorners[0] = 16;
      xCorners[1] = 2;
      xCorners[2] = -4;
      xCorners[3] = -4;
      xCorners[4] = 0;
      xCorners[5] = -4;
      xCorners[6] = -4;
      xCorners[7] = 2;
      yCorners[0] = 0;
      yCorners[1] = -4;
      yCorners[2] = -8;
      yCorners[3] = -10;
      yCorners[4] = 0;
      yCorners[5] = 10;
      yCorners[6] = 8;
      yCorners[7] = 4;

      myColor = color(0, 0, 255);
      myCenterX = 300;
      myCenterY = 300;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
    }

    /*public void show() {

    }*/
    
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

public void keyPressed() {
  if (key == 'a' || key == 'A') {
    ((SpaceShip)thingies[0]).rotate(-8);
  } else if (key == 'd' || key =='D') {
    ((SpaceShip)thingies[0]).rotate(8);
  } else if (key == 's' || key == 'S' || key == 'w' || key == 'W') {
    ((SpaceShip)thingies[0]).accelerate(1);
  } else if (keyCode == 32) {
    ((SpaceShip)thingies[0]).setX((int)(Math.random()*width));
    ((SpaceShip)thingies[0]).setY((int)(Math.random()*height));
    ((SpaceShip)thingies[0]).setPointDirection((int)(Math.random()*360));
    ((SpaceShip)thingies[0]).setDirectionX(0);
    ((SpaceShip)thingies[0]).setDirectionY(0);
  }
}