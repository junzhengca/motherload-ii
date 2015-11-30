class Player {
 
  Engine e;
  //PImage player;
  Gif player;
  float x, y, xSpeed, ySpeed, size, drillSpeed;
  boolean isMovingUp, isMovingDown, isMovingRight, isMovingLeft;
  
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
    //player = loadImage("playerVehicle3.png");
    player = new Gif(this, "playerVehicle.gif");
    player.play();
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
    }
    if (key == 'd'){
      isMovingRight = true;
    }
    if (key == 'a'){
      isMovingLeft = true;
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
    //image(player, e.actualPosition(x, y)[0], e.actualPosition(x, y)[1], e.actualSize(size*1.5), e.actualSize(size));
    image(player, e.actualPosition(x, y)[0], e.actualPosition(x, y)[1], e.actualSize(size*1.5), e.actualSize(size));
  }
  
}