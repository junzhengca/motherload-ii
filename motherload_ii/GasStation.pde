// Colllision is not working 100%, I need to check with Bishal some stuff about the player on monday

class GasStation{
  int x,y;
  Engine e;
  Player p;
  boolean touchingPlayer;
  ElementManager em;
  color fillColor;
  
  GasStation(Engine theEngine, Player thePlayer, ElementManager em_){
    e = theEngine;
    p = thePlayer;
    touchingPlayer = false;
    em = em_;
    x = 300;
    y = -120;
    fillColor = color(0,255,0);
  }
  
  void display(){
    collision();
    setFill();
    rectMode(CORNER);
    rect(e.actualPosition(x,y)[0], e.actualPosition(x,y + em.offset)[1], e.actualSize(200), e.actualSize(120));
  }
  
  
  
  void collision(){
    if(e.player.x > this.x && e.player.x < this.x+200 && e.player.y+75 > this.y && e.player.y < this.y+120){
      touchingPlayer = true;
    }
    else{
      touchingPlayer = false;
    }
  }
  
  void setFill(){
    if(touchingPlayer){
      fillColor = color(255,0,0);
    }
    else{
      fillColor = color(0,255,0);
    }
    fill(fillColor);
  }
  
}