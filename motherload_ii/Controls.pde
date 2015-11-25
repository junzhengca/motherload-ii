class Button {
  Engine e;
  float x,y,w,h;
  boolean mouseOver = false;
  Button(Engine e, float x,float y,float w,float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.e = e;
  }
  
  void tick(float ms){
    checkCollision();
  }
  
  void checkCollision(){
    if(mouseX > e.actualPosition(x,y)[0] && mouseX < e.actualPosition(x,y)[0] + e.actualSize(w) && mouseY > e.actualPosition(x,y)[1] && mouseY < e.actualPosition(x,y)[1] + e.actualSize(h)){
      this.mouseOver = true;
    } else {
      this.mouseOver = false;
    }
  }
  
}

class testButton extends Button {
  testButton(Engine e, float x,float y,float w,float h){
    super(e,x,y,w,h); 
  }
  
  void tick(float ms){
    super.tick(ms);
    if(mouseOver){
      fill(255,0,0);
    } else {
      fill(0,255,0);
    }
    rect(e.actualPosition(x,y)[0],e.actualPosition(x,y)[1],e.actualSize(w),e.actualSize(h));
  }
}