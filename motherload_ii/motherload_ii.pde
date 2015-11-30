import java.lang.*;
Engine e;
int lastMillis;

void setup(){
  e = new Engine();
  lastMillis = (int)System.nanoTime() / 100000;
  fullScreen();
  frameRate(120);
}

void draw(){
  background(0);
  e.tick((int)System.nanoTime() / 100000 - lastMillis);
  lastMillis = (int)System.nanoTime() / 100000;
}