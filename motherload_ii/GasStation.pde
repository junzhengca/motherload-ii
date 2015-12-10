class GasStation{
  
  int x,y;
  Engine e;
  Player p;
  boolean touchingPlayer;
  ElementManager em;
  color fillColor;
  PImage nyanCat;
  
  GasStation(Engine theEngine, Player thePlayer, ElementManager em_){
    e = theEngine;
    p = thePlayer;
    touchingPlayer = false;
    em = em_;
    x = 300;
    y = -120;
    fillColor = color(0,255,0);
    nyanCat = loadImage("nyan-cat.png");
    nyanCat.resize((int)e.s(200),0);
  }
  
  
  // This functio calls all the other functions and displays the gas station. 
  void display(){
    lowFuel();
    collision();
    setFill();
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
  
  
  void setFill(){
    if(touchingPlayer && e.player.fuel == 10){
      fillColor = color(255,0,0);
      e.hud.showingFuelMessage = true;
    }
    else{
      fillColor = color(0,255,0);
      e.hud.showingFuelMessage = false;
    }
    fill(fillColor);
  }
  
  
  // Function that fills the players gas tank if the have enough money, are touching the gas station, and the didnt just fill up.
  void fillGas(){
    if(touchingPlayer && e.cashVal >= 600 && e.player.fuel < 9){
      e.player.fuel = 10; 
      e.cashVal -= 600;
    }
  }
  
  
  void lowFuel(){
   if(e.player.fuel <= 2){
    e.hud.showingLowFuel = true; 
   }
   else{
    e.hud.showingLowFuel = false; 
   }
  }
  
}