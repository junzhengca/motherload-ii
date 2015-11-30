class GasStation{
 int x,y;
 Engine e;
 
  GasStation(Engine theEngine){
    e = theEngine;
  }
  
  
  void display(){
   rectMode(CENTER);
   rect(x,y,100,150);
  }
  
}