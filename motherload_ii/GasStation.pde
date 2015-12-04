class GasStation{
  int x,y;
  Engine e;
  Player p;
  boolean touchingPlayer;
  ElementManager em;
  
  GasStation(Engine theEngine, Player thePlayer, ElementManager em_){
    e = theEngine;
    p = thePlayer;
    touchingPlayer = false;
    em = em_;
    x = 300;
    y = -120;
  }
  
  void display(){
    fill(0,255,0);
    rectMode(CORNER);
    rect(e.actualPosition(x,y)[0], e.actualPosition(x,y + em.offset)[1], e.actualSize(200), e.actualSize(120));
  }
  
  
  
  void collosion(){
    if(e.player.x > this.x && e.player.x < this.x+200){
      fill(255,0,0);
    }
  }
  
}