class ElementManager {

  Element[][] elements;
  int w, h, randomNum; 
  Engine e;



  ElementManager(Engine e_) {
    w = 1000;
    e = e_;
    elements = new Element[10][100];
  }


  void createMap() {
    for (int y = 0; y < 100; y ++) {
      for (int x = 0; x <10; x ++) {
        randomNum = int(random(1, 7));
        if (randomNum == 1 || randomNum == 2 || randomNum ==3) {
          elements[x][y] = new Dirt(e,x*100,y*100);
        } else if (randomNum == 4) {
          elements[x][y] = new Iron(e,x*100,y*100);
        } else if (randomNum == 5) {
          elements[x][y] = new Gold(e,x*100,y*100);
        }
        else if (randomNum == 6){
          elements[x][y] = new BlankTile(e,x*100,y*100);
          
        }
      }
    }
  }

  void display() {
    for (int y = 0; y <100; y ++) {
      for (int x = 0; x <10; x ++){
        elements[x][y].display();
    }
  }
}

void destroyblock(int xIndex, int yIndex){
  elements[xIndex][yIndex] = new BlankTile(e,xIndex*100,yIndex*100);
}


String checkBlockType(int xIndex, int yIndex){
  return
  
  
}

}