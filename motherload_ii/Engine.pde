class Engine {
  float w, h, scaleRatio;
  float actualW;
  int currentFrame = 0;
  //testButton b;
  MainMenu mainMenu;
  ElementManager em;
  Engine() {
    this.actualW = 1000.f;
    updateScreenSize();
    em = new ElementManager(this);
    em.createMap();
    mainMenu = new MainMenu(this);
  }

  float actualSize(float value) {
    return value * this.scaleRatio;
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
      em.offset--;
    }
    
    currentFrame++;
    textSize(this.actualSize(30));
    fill(0, 155, 0);
    textAlign(LEFT, TOP);
    //text("msValue - " + str(ms) + " size - " + str(width) + "x" + str(height) + " fc " + str(currentFrame), actualPosition(20, 0)[0], actualPosition(0, 20)[1]);
    
  }
}