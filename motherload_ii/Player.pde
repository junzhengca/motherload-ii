class Player {
 
  Engine e;
  PImage player, playerDown;
  //Gif player;
  float x, y, xSpeed, ySpeed, size, drillSpeed;
  boolean isMovingUp, isMovingDown, isMovingRight, isMovingLeft, facingLeft, facingRight, facingDown;
  
  Player(Engine e){
    this.e = e;
    x = 100;
    y = 100;
    xSpeed = 0.25;
    ySpeed = 0.25;
    size = 75;
    isMovingUp = false;
    isMovingDown = false;
    isMovingRight = false;
    isMovingLeft = false;
    facingRight = true;
    facingLeft = false;
    facingDown = false;
    player = loadImage("playerVehicle3.png");
    playerDown = loadImage("playerVehicle3down.png");
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
  }
  
  void handleKeyPressed(){
    if (key == 'w'){
      isMovingUp = true;
    }
    if (key == 's'){
      isMovingDown = true;
      facingDown = true;
      facingRight = false;
      facingLeft = false;
    }
    if (key == 'd'){
      isMovingRight = true;
      facingRight = true;
      facingLeft = false;
      facingDown = false;
    }
    if (key == 'a'){
      isMovingLeft = true;
      facingLeft = true;
      facingRight = false;
      facingDown = false;
    }
  }
  
  void handleKeyReleased(){
    if (key == 'w'){
      isMovingUp = false;
    }
    if (key == 's'){
      isMovingDown = false;
    }
    if (key == 'd'){
      isMovingRight = false;
    }
    if (key == 'a'){
      isMovingLeft = false;
    }
  }
  
  void display(float ms){
    if (facingLeft){
      scale(-1.0,1.0);
      image(player, -e.actualPosition(x+(size*2), y)[0], e.actualPosition(x, y)[1], e.actualSize(size*1.5), e.actualSize(size));
    }
    if (facingRight){
      image(player, e.actualPosition(x, y)[0], e.actualPosition(x, y)[1], e.actualSize(size*1.5), e.actualSize(size));
    }
    if (facingDown){
      image(playerDown, e.actualPosition(x, y)[0], e.actualPosition(x, y)[1], e.actualSize(size*1.5), e.actualSize(size));
    }
  }
  
}