class ElementManager {

  Element[][] elements;
  int w, h, randomNum,offset; 
  Engine e;



  ElementManager(Engine e_) {
    w = 1000;
    e = e_;
    elements = new Element[10][1000];
  }


  void createMap() {
    for (int y = 0; y < 1000; y ++) {
      for (int x = 0; x <10; x ++) {
        randomNum = int(random(1, 6));
        if (randomNum == 1 || randomNum == 2 || randomNum ==3) {
          elements[x][y] = new Dirt(e,x+100,y+100);
        } else if (randomNum == 4) {
          elements[x][y] = new Iron(e,x+100,y+100);
        } else if (randomNum == 5) {
          elements[x][y] = new Gold(e,x+100,y+100);
        }
      }
    }
  }

  void display() {
    for (int y = 0; y <1000; y ++) {
      for (int x = 0; x <10; x ++){
        elements[x][y].display();
    }
  }
}


}