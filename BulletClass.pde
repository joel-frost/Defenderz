class Bullet {
  int x, y;
  
  int speedX=5;
  
  Bullet(int x, int y)
  {
   this.x = x;
   this.y = y;
  }
  
  void render()
  {
   fill(220,220,0);
   ellipse(x,y,10,10); 
  }
  
  void move()
  {
    x=x+speedX;
  }
  
  void update()
  {
   render();
   move();
  }
}
