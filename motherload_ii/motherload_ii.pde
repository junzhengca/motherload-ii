import java.lang.*;
Engine e;
int lastMillis;

void setup(){
  e = new Engine();
  lastMillis = (int)System.nanoTime() / 100000;
  size(50,50);
  frameRate(120);
}

void draw(){
  background(0);
  e.tick(constrain((int)System.nanoTime() / 100000 - lastMillis,0,200));
  lastMillis = (int)System.nanoTime() / 100000;
}

void keyPressed(){
  e.player.handleKeyPressed();
}

void keyReleased(){
  e.player.handleKeyReleased();
}