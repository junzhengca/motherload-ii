class Player {

  Engine e;
  float x, y, xSpeed, ySpeed, size, drillSpeed, offset;
  PImage playerRight, playerLeft, playerDown;
  boolean isMovingUp, isMovingDown, isMovingRight, isMovingLeft, facingLeft, facingRight, facingDown;
  int fuel,fuelStartTime;

  Player(Engine e) {
    this.e = e;
    x = 100;
    y = 0;
    xSpeed = 0.05;
    ySpeed = 0.05;
    offset = 0.0;
    size = 75;
    fuel = 10;
    fuelStartTime = millis();
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
  }
  
  String getBlockType(int x, int y){
    return e.em.checkBlockType(constrain((int)x/100,0,9), constrain(((int)y / 100),0,3000));
  }
  
  String getBlockType(float x, float y){
    return getBlockType((int)ceil(x),(int)ceil(y));
  }

  void move(float ms) {
    if(this.y >= 0){ //if player is under surface
      if (facingRight && this.x <= 900 && y >= 50){ //facing right
        if(mousePressed) mineElement(this.x + 100,this.y - 50); //if i do ceil() it will be 1 y index off for left and right
      }
      
      if (facingLeft && this.x >= 20 && y >= 50){ //facing left
        if(mousePressed) mineElement(this.x,this.y - 50);
      }
      
      if (facingDown){ //facing down
        if(mousePressed) mineElement(this.x + 50,this.y + 35);
      }
    }
    
    if(getBlockType(x + 20,y).equals("BlankTile") && getBlockType(x + 70,y).equals("BlankTile")){
      isMovingDown = true;
    } else {
      isMovingDown = false;
    }
    
    if (isMovingUp) {
      if (e.em.checkBlockType((int)(this.x + 50) / 100, constrain((int)((this.y) / 100) - 1,0,1000000)).equals("BlankTile") && e.em.checkBlockType((int)((this.x) + 50) / 100, constrain((int)((this.y) / 100) - 1,0,1000000)).equals("BlankTile")) {
        //e.console("empty");
        //isMovingDown = true;
        y -= ySpeed * 2 *  ms;
        //offset -= ySpeed * 2 *  ms;
      }
    }
    if (isMovingDown){
      y += ySpeed * ms;
      offset += ySpeed * ms;
    }
    if (isMovingRight && getBlockType(x + 90,y - 50).equals("BlankTile")) {
      x += xSpeed * ms;
    }
    if (isMovingLeft && getBlockType(x + 10,y - 50).equals("BlankTile")) {
      x -= xSpeed * ms;
    }
    x = constrain(x, 0, 900);
  }
  
  void mineElement(int x, int y){
    switch(getBlockType(x,y)){
      case "Dirt":
        e.prevCashVal = e.cashVal;
        e.score += 1;
        e.hud.showCashVal();
      break;
      case "Iron":
        e.prevCashVal = e.cashVal;
        e.cashVal += 100;
        e.score += 5;
        e.hud.showCashVal();
      break;
      case "Gold":
        e.prevCashVal = e.cashVal;
        e.cashVal += 200;
        e.score += 10;
        e.hud.showCashVal();
      break;
      default:
      break;
    }
    e.em.destroyblock(constrain(((int)x/100),0,9), constrain(((int)y / 100),0,10000)); 
  }
  
  void mineElement(float x, float y){
    mineElement((int)x,(int)y);
  }
  
  void handleKeyPressed() {
    if (key == 'w' || key == 'W' || keyCode == UP) {
      isMovingUp = true;
    }
    if (key == 's' || key == 'S' || keyCode == DOWN) {
      //isMovingDown = true;
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
    fuelLoss();
    if (facingRight) {
      image(playerRight, e.x(x), e.y(330), e.s(size*1.5), e.s(size));
    }
    if (facingLeft) {
      image(playerLeft, e.x(x), e.y(330), e.s(size*1.5), e.s(size));
    }
    if (facingDown) {
      image(playerDown, e.x(x-30), e.y(330), e.s(size*2.25), e.s(size*1.5));
    }
    
  }
  
  void fuelLoss(){
    if(millis() > fuelStartTime + 5000 && fuel > 0){
      fuel--;
      fuelStartTime = millis();
    }
  }
  
}