class Element {

  int x, y, value, size,offset;
  float hardness;
  color theColor;
  Engine e;
  boolean isDrawn;
  ElementManager em;
  PImage elementImg;
  
  Element(int _x, int _y, int _value, float _hardness, color _color, Engine theEngine, PImage img, ElementManager _em) {
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
    this.elementImg = img;
    this.elementImg.resize((int)e.actualSize(size), (int)e.actualSize(size));
  }
  
  void display() {
    if (isDrawn) {
      //rectMode(CENTER);
      fill(theColor);
      noStroke();
      //rect(e.actualPosition(x, y)[0], e.actualPosition(x, y - em.offset)[1], e.actualSize(size), e.actualSize(size));
      image(elementImg,e.actualPosition(x, y)[0], e.actualPosition(x, y - em.offset)[1]);
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