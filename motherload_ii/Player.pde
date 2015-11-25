class Player {
 
  Engine e;
  PImage player;
  float x, y, xSpeed, ySpeed, size, drillSpeed;
  
  Player(Engine e){
    this.e = e;
    x = 100;
    y = 100;
    xSpeed = 0.3;
    ySpeed = 0.3;
    size = 200;
  }
  
  void move(float ms){
    if (keyPressed){
      if (key == 'w'){
        y -= ySpeed * ms;
      }
      if (key == 's'){
        y += ySpeed * ms;
      }
      if (key == 'd'){
        x += xSpeed * ms;
      }
      if (key == 'a'){
        x -= xSpeed * ms;
      }
    }
  }
  
  
  void display(float ms){
    fill(0);
    rect(e.actualPosition(x, y)[0], e.actualPosition(x, y)[1], e.actualSize(size), e.actualSize(size));
  }
  
}