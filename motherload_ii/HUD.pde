class HUD{
  
  Engine e;
  PImage tank;
  int fuelHeight;
 
  HUD(Engine theEngine){
    e = theEngine;
    tank = loadImage("Fuel-icon.png");
  }
  
  void printToScreen(){
    textSize(32);
    fill(255,0,0);
    fuelHeight = e.player.fuel*10;
    rect(e.x(115),e.y(197-fuelHeight),e.actualSize(65),e.actualSize(fuelHeight));
    image(tank,e.actualPosition(100,100)[0],e.actualPosition(100,100)[1],e.actualSize(100),e.actualSize(100));
  }
  
}