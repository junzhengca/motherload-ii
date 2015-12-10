import java.lang.*;
Engine e;
int lastMillis;

void setup(){
  e = new Engine();
  lastMillis = (int)System.nanoTime() / 100000;
  size(500,500);
  frameRate(120);
}

void draw(){
  background(0);
  e.tick(constrain((int)System.nanoTime() / 100000 - lastMillis,0,200));
  lastMillis = (int)System.nanoTime() / 100000;
}

void keyPressed(){
  e.player.handleKeyPressed();        //Checks for when key is pressed, for the Player class (for movement)
}

void keyReleased(){
  e.player.handleKeyReleased();        //Checks for when key is released, for the Player class (for movement)
}