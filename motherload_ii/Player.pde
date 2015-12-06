class Player {

  //Gif player;
  Engine e;
  float x, y, xSpeed, ySpeed, size, drillSpeed, offset;
  PImage playerRight, playerLeft, playerDown;
  boolean isMovingUp, isMovingDown, isMovingRight, isMovingLeft, facingLeft, facingRight, facingDown;

  Player(Engine e) {
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

  void move(float ms) {
    if (isMovingUp) {
      y -= ySpeed * 2 *  ms;
      offset -= ySpeed * 2 *  ms;
    }
    if (isMovingDown){
      y += ySpeed * ms;
      offset += ySpeed * ms;
    }
    if (isMovingRight) {
      x += xSpeed * ms;
    }
    if (isMovingLeft) {
      x -= xSpeed * ms;
    }
    if(this.y >= 140){
      if (e.em.checkBlockType((int)this.x / 100, (int)((this.y - 140) / 100)).equals("BlankTile")) {
        //e.console("empty");
        isMovingDown = true;
      } else {
        e.console(str(this.y));
        if(isMovingDown){
          e.em.destroyblock((int)this.x / 100,(int)((this.y - 140) / 100));
          isMovingDown = false;
        }
      }
    } else {
      isMovingDown = true;
    }
  }

  void handleKeyPressed() {
    if (key == 'w' || key == 'W' || keyCode == UP) {
      isMovingUp = true;
    }
    if (key == 's' || key == 'S' || keyCode == DOWN) {
      isMovingDown = true;
      facingDown = true;
      facingLeft = false;
      facingRight = false;
    }
    if (key == 'd' || key == 'D' || keyCode == RIGHT) {
      isMovingRight = true;
      facingRight = true;
      facingLeft = false;
      facingDown = false;
    }
    if (key == 'a' || key == 'A' || keyCode == LEFT) {
      isMovingLeft = true;
      facingLeft = true;
      facingDown = false;
      facingRight = false;
    }
  }

  void handleKeyReleased() {
    if (key == 'w' || key == 'W' || keyCode == UP) {
      isMovingUp = false;
    }
    if (key == 's' || key == 'S' || keyCode == DOWN) {
      isMovingDown = false;
    }
    if (key == 'd' || key == 'D' || keyCode == RIGHT) {
      isMovingRight = false;
    }
    if (key == 'a' || key == 'A' || keyCode == LEFT) {
      isMovingLeft = false;
    }
  }

  void display() {
    float actualY = y;
    if(y > 500){
      actualY = 500;
    }
    if (facingRight) {
      image(playerRight, e.x(x), e.y(actualY), e.s(size*1.5), e.s(size));
    }
    if (facingLeft) {
      image(playerLeft, e.x(x), e.y(actualY), e.s(size*1.5), e.s(size));
    }
    if (facingDown) {
      image(playerDown, e.x(x-30), e.y(actualY+7), e.s(size*2.25), e.s(size*1.5));
    }
    rect(e.x(this.x + 50), e.y(actualY + 50), 20, 20);
  }
}