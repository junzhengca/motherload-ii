class Player {
 
  //Gif player;
  Engine e;
  PImage player, playerDown;
  float x, y, xSpeed, ySpeed, size, drillSpeed;
  boolean isMovingUp, isMovingDown, isMovingRight, isMovingLeft, facingLeft, facingRight, facingDown;
  
  Player(Engine e){
    this.e = e;
    //x = e.actualPosition(100, 0)[0];
    //y = e.actualPosition(0, 100)[1];
    x = 100;
    y = 100;
    xSpeed = 0.05;
    ySpeed = 0.05;
    size = 75;
    facingRight = true;
    facingLeft = false;
    facingDown = false;
    isMovingUp = false;
    isMovingLeft = false;
    isMovingDown = false;
    isMovingRight = false;
    player = loadImage("playerVehicle.png");
    playerDown = loadImage("playerVehicleDown.png");
    //player = new Gif(this, "playerVehicle.gif");
    //player.play();
  }
  
  void move(float ms){
    if (isMovingUp){
      y -= ySpeed * ms;
    }
    if (isMovingDown){
      y += ySpeed * ms;
    }
    if (isMovingRight){
      x += xSpeed * ms;
    }
    if (isMovingLeft){
      x -= xSpeed * ms;
    }
    //x = constrain(x, e.actualPosition(0, 0)[0], e.actualPosition(width, 0)[0]);
    //y = constrain(x, e.actualPosition(0, 0)[0], e.actualPosition(0, height)[1]);
  }
  
  void handleKeyPressed(){
    if (key == 'w' || key == 'W' || keyCode == UP){
      isMovingUp = true;
    }
    if (key == 's' || key == 'S' || keyCode == DOWN){
      isMovingDown = true;
      facingDown = true;
      facingLeft = false;
      facingRight = false;
    }
    if (key == 'd' || key == 'D' || keyCode == RIGHT){
      isMovingRight = true;
      facingRight = true;
      facingLeft = false;
      facingDown = false;
    }
    if (key == 'a' || key == 'A' || keyCode == LEFT){
      isMovingLeft = true;
      facingLeft = true;
      facingDown = false;
      facingRight = false;
    }
  }
  
  void handleKeyReleased(){
    if (key == 'w' || key == 'W' || keyCode == UP){
      isMovingUp = false;
    }
    if (key == 's' || key == 'S' || keyCode == DOWN){
      isMovingDown = false;
    }
    if (key == 'd' || key == 'D' || keyCode == RIGHT){
      isMovingRight = false;
    }
    if (key == 'a' || key == 'A' || keyCode == LEFT){
      isMovingLeft = false;
    }
  }
  
  void display(){
    if (facingRight){
      image(player, e.x(x), e.y(y), e.s(size*1.5), e.s(size));
    }
    if (facingLeft){
      scale(-1.0,1.0);
      image(player, -e.x(x+(size*1.5)), e.y(y), e.s(size*1.5), e.s(size));
    }
    if (facingDown){
      scale(1.5,1.5);
      image(playerDown, e.x(x-(x*1.75)), e.y(y-(y*0.30)), e.s(size*1.5), e.s(size));
    }
  }
  
}