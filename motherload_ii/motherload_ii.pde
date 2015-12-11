/*
  Computer Science 30 Pair Programming Assignment
  A remake of the game Motherload
  Copyright Jack, Lars, Bishal All Rights Reserved
  License : MIT
  Full Git repo is avaliable at : https://github.com/kiroshiime/motherload-ii
**/


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
  e.tick(constrain((int)System.nanoTime() / 100000 - lastMillis,0,200));
  lastMillis = (int)System.nanoTime() / 100000;
}

void keyPressed(){
  e.player.handleKeyPressed();        //Checks for when key is pressed, for the Player class (for movement)
}

void keyReleased(){
  e.player.handleKeyReleased();        //Checks for when key is released, for the Player class (for movement)
}