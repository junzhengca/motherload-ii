class Button {
  
  Engine e;
  float x,y,w,h;
  boolean mouseOver = false;
  boolean mouseDown = false;
  
  Button(Engine e, float x,float y,float w,float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.e = e;
  }
  
  void setY(float y){
    this.y = y;
  }
  
  void tick(float ms){
    checkCollision();
  }
  
  void checkCollision(){
    mouseDown = false; 
    if(mouseX > e.actualPosition(x,y)[0] && mouseX < e.actualPosition(x,y)[0] + e.actualSize(w) && mouseY > e.actualPosition(x,y)[1] && mouseY < e.actualPosition(x,y)[1] + e.actualSize(h)){
      this.mouseOver = true;
      if(mousePressed){
        mouseDown = true; 
      }
    } else {
      this.mouseOver = false;
    }
  }
  
}

class StartButton extends Button {
  
  PImage defaultImg, hoverImg;
  
  StartButton(Engine e, float x,float y,float w,float h){
    super(e,x,y,w,h); 
    defaultImg = loadImage("start-button-default.png");
    hoverImg = loadImage("start-button-hover.png");
  }
  
  void tick(float ms){
    super.tick(ms);
    if(mouseOver){
      image(hoverImg,e.actualPosition(x,y)[0],e.actualPosition(x,y)[1],e.actualSize(w),e.actualSize(h));
    } else {
      image(defaultImg,e.actualPosition(x,y)[0],e.actualPosition(x,y)[1],e.actualSize(w),e.actualSize(h));
    }
  }
  
}