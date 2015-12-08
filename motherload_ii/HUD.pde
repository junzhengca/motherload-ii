class HUD{
 Engine e;
 PImage tank, fuelLevelImage;
 int fuelHeight;
 boolean showingFuelMessage = false;
 
 HUD(Engine theEngine){
   e = theEngine;
   tank = loadImage("Fuel-icon.png");
   fuelLevelImage = loadImage("fuel-level-full.png");
   fuelLevelImage.resize((int)e.s(1000),0);
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
    if(e.currentFrame % 10 <= 3){
      image(fuelLevelImage,e.x(0),e.y(500));
    }
  }
  
}