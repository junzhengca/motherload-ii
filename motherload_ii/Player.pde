//Player class that holds all necessary information for a Player object when/if created
class Player {
  
  //Class variables
  Engine e;
  float x, y, xSpeed, ySpeed, size, offset, fuel;
  PImage playerRight, playerLeft, playerDown;
  boolean isMovingUp, isMovingDown, isMovingRight, isMovingLeft, facingLeft, facingRight, facingDown;
  int fuelStartTime;
  float currentPressTime = 0;
  float currentHardness = 0;

  //Constructor
  Player(Engine e) {
    this.e = e;
    x = 100;
    y = 0;
    xSpeed = 0.05;
    ySpeed = 0.07;
    offset = 0.0;
    size = 75;
    fuel = 10.0;
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
  
  
  //Class functions
  String getBlockType(int x, int y){
    return e.em.checkBlockType(constrain((int)x/100,0,9), constrain(((int)y / 100),0,3000));
  }
  
  
  String getBlockType(float x, float y){
    return getBlockType((int)ceil(x),(int)ceil(y));
  }


  void move(float ms) {
    if(this.y >= 0){ //if player is under surface
      if (facingRight && this.x <= 900 && y >= 50){ //facing right
        if(mousePressed){
          mineElement(this.x + 100,this.y - 50,ms); //if i do ceil() it will be 1 y index off for left and right
        }
      }
      
      if (facingLeft && this.x >= 20 && y >= 50){ //facing left
        if(mousePressed){
          mineElement(this.x,this.y - 50,ms);
        }
      }
      
      if (facingDown){ //facing down
        if(mousePressed){
          mineElement(this.x + 50,this.y + 35,ms);
        }
      }
    }
    
    //If block underneath the player is empty, this makes the player fall to the next level 
    if(getBlockType(x + 20,y).equals("BlankTile") && getBlockType(x + 70,y).equals("BlankTile") || y <= 0){
      isMovingDown = true;
    } else {
      isMovingDown = false;
    }
    
    //Player Movement
    if (isMovingUp) {        //If block above the player is empty, this allows the player to fly up
      if (e.em.checkBlockType((int)(this.x + 50) / 100, constrain((int)((this.y) / 100) - 1,0,1000000)).equals("BlankTile") && e.em.checkBlockType((int)((this.x) + 50) / 100, constrain((int)((this.y) / 100) - 1,0,1000000)).equals("BlankTile")) {        //Checks for block above the player
        //e.console("empty");
        //offset -= ySpeed * 2 *  ms;
        y -= ySpeed * 2 *  ms;
      }
    }
    if (isMovingDown){
      y += ySpeed * ms;
      offset += ySpeed * ms;
    }
    if (isMovingRight && (getBlockType(x + 90,y - 50).equals("BlankTile") || y <= 20)) {        //Checks for block right of player (if empty)
      x += xSpeed * ms;
    }
    if (isMovingLeft && (getBlockType(x + 10,y - 50).equals("BlankTile") || y <= 20)) {        //Checks for block left of player (if empty)
      x -= xSpeed * ms;
    }
    x = constrain(x, 0, 900);
  }
  
  
  //Detorying elements when the player mines for them
  void mineElement(int x, int y, float ms){
    currentHardness = e.em.elements[constrain(((int)x/100),0,9)][constrain(((int)y / 100),0,10000)].hardness;        //Gets hardness value of particular element being mined
    
    switch(getBlockType(x,y)){
      case "Dirt":
        //Increases the amount of time the player has been mining this particular element for
        currentPressTime += ms;
        //Changes image of element when image is half-mined to let player know of it
        if (currentPressTime > currentHardness * 500 && currentPressTime < currentHardness * 1000){
          e.em.elements[constrain(((int)x/100),0,9)][constrain(((int)y / 100),0,10000)].elementImg = e.em.dirtHalfImage;
          e.em.elements[constrain(((int)x/100),0,9)][constrain(((int)y / 100),0,10000)].elementImg.resize((int)e.s(e.em.elements[constrain(((int)x/100),0,9)][constrain(((int)y / 100),0,10000)].size), (int)e.s(e.em.elements[constrain(((int)x/100),0,9)][constrain(((int)y / 100),0,10000)].size));
        }
      break;
      case "Iron":
        currentPressTime += ms;
        if (currentPressTime > currentHardness * 500 && currentPressTime < currentHardness * 1000){
          e.em.elements[constrain(((int)x/100),0,9)][constrain(((int)y / 100),0,10000)].elementImg = e.em.ironHalfImage;
          e.em.elements[constrain(((int)x/100),0,9)][constrain(((int)y / 100),0,10000)].elementImg.resize((int)e.s(e.em.elements[constrain(((int)x/100),0,9)][constrain(((int)y / 100),0,10000)].size), (int)e.s(e.em.elements[constrain(((int)x/100),0,9)][constrain(((int)y / 100),0,10000)].size));
        }
      break;
      case "Gold":
        currentPressTime += ms;
        if (currentPressTime > currentHardness * 500 && currentPressTime < currentHardness * 1000){
          e.em.elements[constrain(((int)x/100),0,9)][constrain(((int)y / 100),0,10000)].elementImg = e.em.goldHalfImage;
          e.em.elements[constrain(((int)x/100),0,9)][constrain(((int)y / 100),0,10000)].elementImg.resize((int)e.s(e.em.elements[constrain(((int)x/100),0,9)][constrain(((int)y / 100),0,10000)].size), (int)e.s(e.em.elements[constrain(((int)x/100),0,9)][constrain(((int)y / 100),0,10000)].size));
        }
      break;
      default:
        currentPressTime = 0;
      break;
    }
    
    if(currentPressTime > currentHardness * 1000){        //Checks to see if element needs to be destroyed
      currentPressTime = 0;
      //Increases the total money and score of the player according to the element being mined
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
          currentPressTime = 0;
        break;
      }
      e.em.destroyblock(constrain(((int)x/100),0,9), constrain(((int)y / 100),0,10000));        //Destroys the element
    }
  }
  
  
  void mineElement(float x, float y, float ms){
    mineElement((int)x,(int)y,ms);
  }
  
  
  //Reacts to when key is pressed (for player movement)
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
  
  
  //Reacts to when key is released (for player movement)
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


  //Displays the player according to the direction it is facing
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
    rect(0,0,(currentPressTime / (currentHardness * 1000)) * 100,e.s(20));        //How long the player has been mining an element for
  }
  
  
  //Player fuel being lost over time
  void fuelLoss(){
    if(millis() > fuelStartTime + 5000 && fuel > 0){
      fuel--;
      fuelStartTime = millis();
    }
  }
  
}