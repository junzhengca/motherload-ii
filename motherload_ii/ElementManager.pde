// Class for storing and dealing with the elements in the map. Has multiple methods that deal with elements. 
class ElementManager {
  
  //Class variables
  Element[][] elements;
  int w, h, randomNum;
  float offset = 0;
  Engine e;
  PImage dirtImage, dirtHalfImage, goldImage, goldHalfImage, ironImage, ironHalfImage, blankImage;

  //Constructor
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


  // This function creates the map of elements and stores it in a 2D Object array. 
  void createMap() {
    // Iterate over 2D array and with 2 for loops. Create a random number and generate a tile based on that number. 
    for (int y = 0; y < 300; y ++) {
      for (int x = 0; x <10; x ++) {
        if (y == 0 || y ==1) {
          //First 2 rows will always be dirt. 
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


  // Set the offset. Used for drawing in relation to the player.
  void setOffset(float val) {
    this.offset = val;
  }


  // Iterates over the entire array and calls each objects display Function
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


  // This function takes in the indexes for the block in the array and "Destroys" it. (Turns it into a blank tile)
  void destroyblock(int xIndex, int yIndex) {
    elements[xIndex][yIndex] = new BlankTile(e, xIndex*100, yIndex*100,blankImage, this);
  }


  // this function takes in the indexes for the block in the array and returns what type of element it is. 
  String checkBlockType(int xIndex, int yIndex) {
    String className = split(elements[xIndex][yIndex].getClass().getName(), "$")[1]; //Get object's class name
    return className;
  }
  
}