// A child class for the Blank Tile. Has 100% alpha transparency and cannot be drilled. 
class BlankTile extends Element {
   BlankTile(Engine e,int x_,int y_,PImage img, ElementManager em){
     //calling parent constructor and passing through values
     super(x_,y_,0,color(255,255,255,0),e,img,em);
   }
}