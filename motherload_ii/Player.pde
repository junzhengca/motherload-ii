class Player {
 
  //Gif player;
  Engine e;
  float x, y, xSpeed, ySpeed, size, drillSpeed,offset;
  PImage playerRight, playerLeft, playerDown;
  boolean isMovingUp, isMovingDown, isMovingRight, isMovingLeft, facingLeft, facingRight, facingDown;
  
  Player(Engine e){
    this.e = e;
    //x = e.x(100);
    //y = e.y(100);
    x = 100;
    y = 0;
    xSpeed = 0.05;
    ySpeed = 0.05;
    offset = 0.0;
    size = 75;
    facingRight = true;
    facingLeft = false;
    facingDown = false;
    isMovingUp = false;
    isMovingLeft = false;
    isMovingDown = false;
    isMovingRight = false;
    playerRight = loadImage("playerVehicleRight.png");
    playerLeft = loadImage("playerVehicleLeft.png");
    playerDown = loadImage("playerVehicleDown.png");
    //player = new Gif(this, "playerVehicle.gif");
    //player.play();
  }
  
  void move(float ms){
    if (isMovingUp){
      y -= ySpeed * 3 * ms;
    }
    //if (isMovingDown){
    //  y += ySpeed * ms;
    //}
    if (isMovingRight){
      x += xSpeed * ms;
    }
    if (isMovingLeft){
      x -= xSpeed * ms;
    }
    
    if(e.em.checkBlockType((int)this.x / 100,0).equals("BlankTile")){
      e.console("empty");
    } else {
      e.console("not empty");
    }
    if(this.y < e.em.offset - 80){
      y += ySpeed * 2 * ms;
    }
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
      image(playerRight, e.x(x), e.y(y), e.s(size*1.5), e.s(size));
    }
    if (facingLeft){
      image(playerLeft, e.x(x), e.y(y), e.s(size*1.5), e.s(size));
    }
    if (facingDown){
      image(playerDown, e.x(x-30), e.y(y), e.s(size*2.25), e.s(size*1.5));
    }
    rect(e.x(this.x + 50),e.y(this.y + 50),20,20);
  }
  
}