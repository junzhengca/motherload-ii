// Class for the Gas Station. Used to fill the players gas tank
class GasStation{
  
  int x,y;
  Engine e;
  Player p;
  boolean touchingPlayer;
  ElementManager em;
  PImage nyanCat;
  
  GasStation(Engine theEngine, Player thePlayer, ElementManager em_){
    e = theEngine;
    p = thePlayer;
    touchingPlayer = false;
    em = em_;
    x = 300;
    y = -120;
    nyanCat = loadImage("nyan-cat.png");
    nyanCat.resize((int)e.s(200),0);
  }
  
  
  // This function calls all the other functions and displays the gas station. 
  void display(){
    lowFuel();
    collision();
    flashFull();
    fillGas();
    rectMode(CORNER);
    image(nyanCat,e.actualPosition(x,y)[0], e.actualPosition(x,y - em.offset)[1]);
  }
  
  
  // This function checks to see if the player is touching the gas station.
  void collision(){
    if(e.player.x+e.player.size > this.x && e.player.x < this.x+200 && e.player.y+e.player.size > this.y && e.player.y-10 < this.y+120){
      touchingPlayer = true;
    }
    else{
      touchingPlayer = false;
    }
  }
  
  
  // Function that notifies the HUD to flash to the screen when the players tank has been filled. 
  void flashFull(){
    if(touchingPlayer && e.player.fuel == 10){
      e.hud.showingFuelMessage = true;
    }
    else{
      e.hud.showingFuelMessage = false;
    }
  }
  
  
  // Function that fills the players gas tank if the have enough money, are touching the gas station, and they didnt just fill up.
  void fillGas(){
    if(touchingPlayer && e.cashVal >= 600 && e.player.fuel < 9){
      e.player.fuel = 10; 
      e.cashVal -= 600;
    }
  }
  
  
  // This function notifies the HUD to flash to the screen if the player is low on fuel.
  void lowFuel(){
    if(e.player.fuel <= 2){
      e.hud.showingLowFuel = true; 
    }
    else{
      e.hud.showingLowFuel = false; 
    }
  }
  
}