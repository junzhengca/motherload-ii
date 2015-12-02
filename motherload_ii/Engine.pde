class Engine {
  
  float w, h, scaleRatio;
  float actualW;
  int currentFrame = 0;
  //testButton b;
  MainMenu mainMenu;
  ElementManager em;
  Player player;
  Engine() {
    this.actualW = 1000.f;
    updateScreenSize();
    em = new ElementManager(this);
    em.createMap();
    mainMenu = new MainMenu(this);
    player = new Player(this);
  }

  float actualSize(float value) {
    return value * this.scaleRatio;
  }
  
  float s(float value){
    return this.actualSize(value);
  }

  float[] actualPosition(float x, float y) {
    float[] result = new float[]{x * scaleRatio, y * scaleRatio};

    if (width > height) {
      result[0] += (w - actualW * scaleRatio) / 2;
    } else {
      result[1] += (h - actualW * scaleRatio) / 2;
    }

    return result;
  }
  
  float x(float x){
    return this.actualPosition(x,0)[0];
  }
  
  float y(float y){
    return this.actualPosition(0,y)[1];
  }

  void updateScreenSize() {
    this.w = width;
    this.h = height;
    if (width > height) {
      this.scaleRatio = height / this.actualW;
    } else {
      this.scaleRatio = width / this.actualW;
    }
  }


  void drawBackground() {
    fill(0);
    rect(actualPosition(0, 0)[0], actualPosition(0, 0)[1], actualSize(actualW), actualSize(actualW));
  }

  void tick(float ms) {
    updateScreenSize();
    drawBackground();

    //b.tick(ms);
    if (mainMenu != null) mainMenu.tick(ms);
    else {
      em.display();
      em.offset-=10;
    }
    
    currentFrame++;
    player.move(ms);
    player.display();
  }
}