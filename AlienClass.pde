final color ALIEN1 = color(0, 255, 0);
final color ALIEN2 = color(50, 100, 0);

class Alien
{
  float x, y;
  float speedX = random(-6,-3);
  float speedY = -speedX;
  color alienColour;

  Alien() 
  {
    x = width + 40;
    y = (int)random(30,height-40);
  }
  
  void render()
  {
    //draw an alien
    fill(ALIEN1);
    ellipse(x, y, 30, 30);
    fill(ALIEN2);
    ellipse(x, y, 50, 15);
  }
  
  void move()
  {
    x = x+speedX;    
    y = y + speedY;
    if (y<=0+30 || y>=height-30)
    {
      speedY = -speedY;
    }
   
  }
  
  void gameover()
  {
   speedX = 0; 
  }
 
  void update()
  {
    render();
    move();
  }
  
  boolean isShot(Bullet bullet)
  {
   if (bullet!=null) 
   {
     if (abs(this.x-bullet.x) < 20  && abs(this.y-bullet.y) < 20)
     {
       return true;
     }

   }
   return false;
  }
  
}
