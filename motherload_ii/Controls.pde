class Button {
  Engine e;
  float x,y,w,h;
  Button(Engine e, float x,float y,float w,float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.e = e;
  }
  
  void tick(float ms){}
  
}

class testButton extends Button {
  testButton(Engine e, float x,float y,float w,float h){
    super(e,x,y,w,h); 
  }
  
  void tick(float ms){
    fill(255,0,0);
    //rect(e.actualPosition(30,30)[0],e.actualPosition(30,30)[1],e.actualSize(w),e.actualSize(h));
  }
}