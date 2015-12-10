// A child class for the dirt. Most common element. Worthless.
class Dirt extends Element {
   Dirt(Engine e,int x_,int y_,PImage img, ElementManager em){
     //calling parent constructor and passing through values
     super(x_,y_,0,1.0,color(155,118,83),e,img,em);
   }
}