class HUD{
 Engine e;
 PImage tank;
 int fuelHeight;
 boolean showingFuelMessage = false;
 
 HUD(Engine theEngine){
   e = theEngine;
   tank = loadImage("Fuel-icon.png");
 }
  
  
  
  void printToScreen(){
   fill(255,0,0);
   fuelHeight = e.player.fuel*10*10-10;
   fuelHeight = constrain(fuelHeight,0,100);
   rect(e.x(115),e.y(197-fuelHeight),e.actualSize(65),e.actualSize(fuelHeight));
   image(tank,e.actualPosition(100,100)[0],e.actualPosition(100,100)[1],e.actualSize(100),e.actualSize(100));
   if(showingFuelMessage) showFuelLevelFull();
  }
  
  void showFuelLevelFull(){
    textAlign(CENTER);
    textSize(e.s(70));
    fill(255);
    if(e.currentFrame % 10 <= 3){
      text("FUEL IS FULL",e.x(500),e.y(700));
    }
    textAlign(LEFT);
  }
  
}