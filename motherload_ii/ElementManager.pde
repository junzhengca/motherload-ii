class ElementManager {

  Element[][] elements;
  int w, h, randomNum;
  float offset = 0;
  Engine e;
  PImage dirtImage, goldImage, ironImage, blankImage;



  ElementManager(Engine e_) {
    w = 1000;
    e = e_;
    elements = new Element[10][300];
    dirtImage = loadImage("dirt.jpg");
    goldImage = loadImage("gold.jpg");
    ironImage = loadImage("iron.jpg");
    blankImage = loadImage("blank.jpg");
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
  }

  void destroyblock(int xIndex, int yIndex) {
    elements[xIndex][yIndex] = new BlankTile(e, xIndex*100, yIndex*100,blankImage, this);
  }


  String checkBlockType(int xIndex, int yIndex) {
    String className = split(elements[xIndex][yIndex].getClass().getName(), "$")[1]; //Get object's class name
    return className;
  }
}