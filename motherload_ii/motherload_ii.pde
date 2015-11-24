Engine e;
int lastMillis;
void setup(){
  e = new Engine();
  lastMillis = millis();
  fullScreen();
}

void draw(){
  background(0);
  e.tick(millis() - lastMillis);
  lastMillis = millis();
}