// Parent Class for all elements. Contains Variables for all elements including position, hardness, etc.
class Element {
  
  //Class variables
  int x, y, size, offset;
  float hardness;
  color theColor;
  Engine e;
  boolean isDrawn;
  ElementManager em;
  PImage elementImg;
  
  // Setting all variables passed through from when child calls the super constructor.
  Element(int _x, int _y, float _hardness, color _color, Engine theEngine, PImage img, ElementManager _em) {
    x = _x;
    y = _y;
    size = 100;
    hardness = _hardness;
    theColor = _color;
    e = theEngine;
    isDrawn = true;
    offset = 0;
    em = _em;
    this.elementImg = img;
    this.elementImg.resize((int)e.actualSize(size), (int)e.actualSize(size));
  }


  // if the elemenet should be drawn. Draw it at its location.
  void display() {
    if (isDrawn) {
      fill(theColor);
      noStroke();
      image(elementImg,e.actualPosition(x, y)[0], e.actualPosition(x, y - em.offset)[1]);
    }
  }
  
  
  // Checks if the element is on the screen based on where the player is. 
  void checkOnScreen(){
    if(offset+500 > this.y){
      isDrawn = true;
    }
    else{
      isDrawn = false;
    }
  }
}