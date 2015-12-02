class GasStation{
  int x,y;
  Engine e;
  Player p;
  boolean touchingPlayer;
 
  GasStation(Engine theEngine, Player thePlayer){
    e = theEngine;
    p = thePlayer;
    touchingPlayer = false;
    
  }
  
  void display(){
    rectMode(CORNER);
    rect(x,y,100,150);
  }
  
  
  
  void collosion(){
    if(e.player.x > this.x && e.player.x < this.x+150){
      
    }
  }
  
}