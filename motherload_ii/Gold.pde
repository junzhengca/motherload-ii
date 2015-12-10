// Child class for gold. Most valuable element and hardest to drill. 
class Gold extends Element {
   Gold(Engine e,int x_,int y_,PImage img ,ElementManager em){ 
     //calling parent constructor and passing through values
     super(x_,y_,4,6.0,color(212,175,55),e,img,em);
   }
}