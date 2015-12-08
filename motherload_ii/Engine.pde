class Engine {
  
  float w, h, scaleRatio;
  float actualW;
  int currentFrame = 0;
  String debugMessage = "";
  //testButton b;
  MainMenu mainMenu;
  ElementManager em;
  Player player;
  GasStation gs;
  int cashVal = 0;
  int prevCashVal = 0;
  PImage backgroundImg;
  int score;
  HUD hud;
  JSONObject highScoreJson;
  int highScore = 0;
  String highScoreName = "";
  
  Engine() {
    this.actualW = 1000.f;
    highScoreJson = loadJSONObject("data/highscore.json");
    highScore = highScoreJson.getInt("value");
    highScoreName = highScoreJson.getString("name");
    score = 0;
    updateScreenSize();
    em = new ElementManager(this);
    em.createMap();
    mainMenu = new MainMenu(this);
    player = new Player(this);
    em.offset = this.y(200);
    backgroundImg = loadImage("background.jpg");
    backgroundImg.resize((int)s(1000),(int)s(1000));
    gs = new GasStation(this,player,em);
    hud = new HUD(this);
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
      image(backgroundImg,x(0),y(0));
      em.display();
      em.offset = player.y - 400;
      gs.display();
      hud.printToScreen();
      player.move(ms);
      player.display();
      if(player.fuel == 0){
        if(score > highScore){
          highScoreJson.setInt("value",score);
          saveJSONObject(highScoreJson, "data/highscore.json"); 
        }
        highScoreJson = loadJSONObject("data/highscore.json");
        highScore = highScoreJson.getInt("value");
        highScoreName = highScoreJson.getString("name");
        score = 0;
        em = new ElementManager(this);
        em.createMap();
        mainMenu = new MainMenu(this);
        player = new Player(this);
        em.offset = this.y(200);
        backgroundImg = loadImage("background.jpg");
        backgroundImg.resize((int)s(1000),(int)s(1000));
        gs = new GasStation(this,player,em);
        hud = new HUD(this);
      }
    }
    
    currentFrame++;
    
    
    fill(255);
    textSize(16);
    text(this.debugMessage,0,20);
  }
}