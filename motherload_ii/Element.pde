class Element {

  int x, y, hardness, value, size,offset;
  color theColor;
  Engine e;
  boolean isDrawn;
  ElementManager em;
  
  Element(int _x, int _y, int _value, int _hardness, color _color, Engine theEngine, ElementManager _em) {
    x = _x;
    y = _y;
    size = 100;
    value = _value;
    hardness = _hardness;
    theColor = _color;
    e = theEngine;
    isDrawn = true;
    offset = 0;
    em = _em;
  }



  void display() {
    if (isDrawn) {
      //rectMode(CENTER);
      fill(theColor);
      noStroke();
      rect(e.actualPosition(x, y)[0], e.actualPosition(x, y + em.offset)[1], e.actualSize(size), e.actualSize(size));
    }
  }
  
  
  void checkOnScreen(){
   if(offset+500 > this.x){
     isDrawn = true;
   }
   else{
     isDrawn = false;
  }
  }
  
}