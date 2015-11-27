class MainMenu {
  Engine e;
  PImage drillerImg, backgroundImg, mainMenuTitleImg;
  
  MainMenu(Engine e){
    this.e = e;
    drillerImg = loadImage("main-menu-driller.png");
    backgroundImg = loadImage("main-menu-background.png");
    mainMenuTitleImg = loadImage("main-menu-title.png");
    mainMenuTitleImg.resize((int)e.actualSize(1000),0);
  }
  
  void tick(float ms){
    image(backgroundImg,e.actualPosition(0,0)[0],e.actualPosition(0,0)[1],e.actualSize(1000),e.actualSize(1000));
    image(mainMenuTitleImg,e.actualPosition(0,0)[0],e.actualPosition(0,200)[1]);
    image(drillerImg,e.actualPosition(250,0)[0],e.actualPosition(0,300)[1]);
  }
}