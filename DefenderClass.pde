class Defender 
{
  int x, y;
  int speedY = 8;


  Defender(int x, int y)
  {
    this.x = x;
    this.y = y;
  }

  void render()
  {
    fill(255, 0, 0);
    rect(x, y, 50, 20);
    triangle(x+50, y, x+50, y+20, x+60, y+10);
    fill(0, 0, 100);
    rect(x, y-10, 20, 10);
  }

  void move()
  {
    if (key == CODED) 
    {
      if (keyCode == UP && y>=30) 
      {
        y = y-speedY;
      }
      if (keyCode == DOWN && y<=height-30)
      {
        y = y+speedY;
      }
    }
  }
  
  boolean crash()
  {
    color collideColour;
    for (int i=y; i<y+30; i++)
    {
      collideColour = get(x+65,i);
      if (collideColour == ALIEN1)
      {
        return true;
      } 
    }
    return false;
  }
  
}
