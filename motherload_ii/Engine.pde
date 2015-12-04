class Engine {
  
  float w, h, scaleRatio;
  float actualW;
  int currentFrame = 0;
  String debugMessage = "test";
  //testButton b;
  MainMenu mainMenu;
  ElementManager em;
  Player player;
  GasStation gs;
  
  Engine() {
    this.actualW = 1000.f;
    updateScreenSize();
    em = new ElementManager(this);
    em.createMap();
    mainMenu = new MainMenu(this);
    player = new Player(this);
    em.offset = this.y(200);
    gs = new GasStation(this,player,em);
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
  
  void console(String m){
    this.debugMessage = m + "\n" + this.debugMessage;
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
      em.offset = -y(player.y);
      gs.display();
    }
    
    currentFrame++;
    player.move(ms);
    player.display();
    
    
    fill(255);
    textSize(16);
    text(this.debugMessage,0,20);
  }
}