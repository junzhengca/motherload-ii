class ElementManager {

  Element[][] elements;
  int w, h, randomNum;
  float offset = 0;
  Engine e;
  PImage dirtImage, dirtHalfImage, goldImage, goldHalfImage, ironImage, ironHalfImage, blankImage;

  ElementManager(Engine e_) {
    w = 1000;
    e = e_;
    elements = new Element[10][300];
    dirtImage = loadImage("dirt.jpg");
    dirtHalfImage = loadImage("dirtHalf.jpg");
    goldImage = loadImage("gold.jpg");
    goldHalfImage = loadImage("goldHalf.png");
    ironImage = loadImage("iron.jpg");
    ironHalfImage = loadImage("ironHalf.png");
    blankImage = loadImage("blank.png");
  }

  void createMap() {
    for (int y = 0; y < 300; y ++) {
      for (int x = 0; x <10; x ++) {
        if (y == 0 || y ==1) {
          elements[x][y] = new Dirt(e, x*100, y*100,dirtImage, this);
        } else {
          randomNum = int(random(1, 12));
          if (randomNum <= 6) {
            elements[x][y] = new Dirt(e, x*100, y*100,dirtImage, this);
          } else if (randomNum  <=8) {
            elements[x][y] = new Iron(e, x*100, y*100,ironImage, this);
          } else if (randomNum == 9) {
            elements[x][y] = new Gold(e, x*100, y*100,goldImage, this);
          } else if (randomNum <=11) {
            elements[x][y] = new BlankTile(e, x*100, y*100,blankImage, this);
          }
        }
      }
    }
  }

  void setOffset(float val) {
    this.offset = val;
  }

  void display() {
    for (int y = 0; y < 300; y ++) {
      for (int x = 0; x <10; x ++) {
        elements[x][y].display();
      }
    }
    
    //show collision detection points
    fill(255,0,0);
    rect(e.x((int)e.player.x + 100),e.y((int)e.player.y - 35 - offset),5,5); //right
    rect(e.x((int)e.player.x),e.y((int)e.player.y - 35 - offset),5,5); //left
    rect(e.x((int)e.player.x + 50),e.y((int)e.player.y + 35 - offset),5,5); //down
    fill(0,255,0);
    rect(e.x((int)e.player.x + 20),e.y((int)e.player.y - offset),5,5); //left bottom collision
    rect(e.x((int)e.player.x + 70),e.y((int)e.player.y - offset),5,5); //right bottom collision
  }

  void destroyblock(int xIndex, int yIndex) {
    elements[xIndex][yIndex] = new BlankTile(e, xIndex*100, yIndex*100,blankImage, this);
  }

  String checkBlockType(int xIndex, int yIndex) {
    String className = split(elements[xIndex][yIndex].getClass().getName(), "$")[1]; //Get object's class name
    return className;
  }
  
}