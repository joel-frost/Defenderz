Alien[] aliens = new Alien[3];
Defender defender;
Bullet bullet;

PImage background;
int bgX=0; //global variable background location
int gameMode;
int score;

void setup() 
{
  size(800, 400);
  textSize(32);
  background = loadImage("spaceBackground.jpg");
  background.resize(width, height);
  reset();
}

void draw ()
{
  if (gameMode == 0)
  {
    scrollBackground();
        
    defender.render();
    alienSpawner();
    
    for (int i = 0;i<3;i++)
    {
      aliens[i].update();
    }
    
    fill(255);
    text("Score: " + score,625,50);
    
    if (bullet != null)
    {
      bullet.update();
      if (bullet.x>width)
      {
        bullet = null;
      }
    }
       
    if (defender.crash())
    {
     gameMode = 1; 
     fill(255);
     text("Game Over! Press Enter to try again",115,height/2);
     text("Your score was " + score,250,height/2+50);
    }
  }
  
  else if (gameMode == 1)
  {
    for (int i = 0;i<3;i++)
    {
      aliens[i].speedX = 0;
    }
  } 

}
  
void scrollBackground() 
{
  image(background, bgX, 0); //draw background twice adjacent
  image(background, bgX+background.width, 0);
  bgX-=4;
  if (bgX == -background.width)
  {
    bgX=0; //wrap background
  }
}

void keyPressed()
{
  if (gameMode == 0)
  {
    defender.move();
    fireBullet();
  } 
  
  else if (gameMode == 1)
  {
    if (key == ENTER || key == RETURN) 
    {
      reset();       
    }
  }
}

void reset()
  {
    for (int i = 0;i<3;i++)
    {
      aliens[i] = new Alien();
    }
    
    defender = new Defender(50, height/2);
    
    if (bullet!=null)
    {
      bullet = null;
    }
    
    gameMode = 0;
    score = 0;
  }
  
void fireBullet() 
{
  if (key == ' ') 
    {
      bullet = null;
      bullet = new Bullet(defender.x+50,defender.y+10);        
    }
}

void alienSpawner()
{  
  for (int i = 0;i<3;i++)
    {
      if (aliens[i].isShot(bullet))
      {
       score++;
       aliens[i] = null;
       bullet = null;
       aliens[i] = new Alien();
      }
      if (aliens[i].x<-20)
      {
       aliens[i] = new Alien();
      }
    }
}
