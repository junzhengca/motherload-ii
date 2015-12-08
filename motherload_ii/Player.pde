class Player {

  //Gif player;
  Engine e;
  float x, y, xSpeed, ySpeed, size, drillSpeed, offset;
  PImage playerRight, playerLeft, playerDown;
  boolean isMovingUp, isMovingDown, isMovingRight, isMovingLeft, facingLeft, facingRight, facingDown;
  int fuel,fuelStartTime;

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
    //player = new Gif(this, "playerVehicle.gif");
    //player.play();
  }

  void move(float ms) {
    if(this.y >= 0){
      if (facingRight && this.x <= 800 && y >= 50){
        //e.console("right");
        if(e.em.checkBlockType(constrain(((int)this.x/100)+1,0,9), constrain(((int)(this.y + 50) / 100)-1,0,10000)).equals("Iron")){
          if(mousePressed){
            e.prevCashVal = e.cashVal;
            e.cashVal += 100;
            e.console(str(e.cashVal));
            e.score += 5;
            e.hud.showCashVal();
          } else {
            isMovingRight = false;
          }
        } else if (e.em.checkBlockType(constrain(((int)this.x/100)+1,0,9), constrain(((int)(this.y + 50) / 100)-1,0,10000)).equals("Gold")){
          if(mousePressed){
            e.prevCashVal = e.cashVal;
            e.cashVal += 200;
            e.console(str(e.cashVal));
            e.score += 10;
            e.hud.showCashVal();
          } else {
            isMovingRight = false;
          }
        } else if (e.em.checkBlockType(constrain(((int)this.x/100)+1,0,9), constrain(((int)(this.y + 50) / 100)-1,0,10000)).equals("Dirt")){
          if(!mousePressed){
            isMovingRight = false;
          }
        }
        if(mousePressed) e.em.destroyblock(constrain(((int)this.x/100)+1,0,9), constrain(((int)(this.y + 50) / 100)-1,0,10000)); 
      }
      if (facingLeft && this.x >= 20 && y >= 50){
        if(e.em.checkBlockType(constrain(((int)this.x/100),0,9), constrain(((int)(this.y + 50) / 100)-1,0,10000)).equals("Iron")){
          if(mousePressed){
            e.prevCashVal = e.cashVal;
            e.cashVal += 100;
            e.console(str(e.cashVal));
            e.score += 5;
            e.hud.showCashVal();
          } else {
            isMovingLeft = false;
          }
        } else if (e.em.checkBlockType(constrain(((int)this.x/100),0,9), constrain(((int)(this.y + 50) / 100)-1,0,10000)).equals("Gold")){
          if(mousePressed){
            e.prevCashVal = e.cashVal;
            e.cashVal += 200;
            e.console(str(e.cashVal));
            e.score += 10;
            e.hud.showCashVal();
          } else {
            isMovingLeft = false;
          }
        } else if (e.em.checkBlockType(constrain(((int)this.x/100),0,9), constrain(((int)(this.y + 50) / 100)-1,0,10000)).equals("Dirt")){
          if(!mousePressed){
            isMovingLeft = false;
          }
        }
        if(mousePressed) e.em.destroyblock(constrain(((int)this.x/100),0,9), constrain(((int)(this.y + 50) / 100)-1,0,10000)); 
      }
      if (e.em.checkBlockType((int)(this.x + 50) / 100, (int)((this.y) / 100)).equals("BlankTile") && e.em.checkBlockType((int)((this.x) + 50) / 100, (int)((this.y) / 100)).equals("BlankTile")) {
        //e.console("empty");
        isMovingDown = true;
      } else {
        if(mousePressed && facingDown){
          if(e.em.checkBlockType((int)(this.x + 50) / 100,(int)((this.y) / 100)).equals("Iron")){
            e.prevCashVal = e.cashVal;
            e.cashVal += 100;
            e.console(str(e.cashVal));
            e.score += 5;
            e.hud.showCashVal();
          } else if (e.em.checkBlockType((int)(this.x + 50) / 100,(int)((this.y) / 100)).equals("Gold")){
            e.prevCashVal = e.cashVal;
            e.cashVal += 200;
            e.console(str(e.cashVal));
            e.score += 10;
            e.hud.showCashVal();
          }
          e.em.destroyblock((int)(this.x + 50) / 100,(int)((this.y) / 100));
        }
        isMovingDown = false;
      }
    } else {
      isMovingDown = true;
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
    if (isMovingRight) {
      x += xSpeed * ms;
    }
    if (isMovingLeft) {
      x -= xSpeed * ms;
    }
    
    x = constrain(x, 0, 900);
    //y = constrain(y, e.y(0), e.y(height-(size)));
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
    //e.console(str(y));
    if (facingRight) {
      image(playerRight, e.x(x), e.y(330), e.s(size*1.5), e.s(size));
    }
    if (facingLeft) {
      image(playerLeft, e.x(x), e.y(330), e.s(size*1.5), e.s(size));
    }
    if (facingDown) {
      image(playerDown, e.x(x-30), e.y(330), e.s(size*2.25), e.s(size*1.5));
    }
    //rect(e.x(this.x + 50), e.y(y + 50), 20, 20);
  }
  
  void fuelLoss(){
   if(millis() > fuelStartTime + 5000 && fuel > 0){
     fuel--;
     fuelStartTime = millis();
   }
  }
}