// Class that handles the HUD and all messages displayed to the screen. 
class HUD {

  //Class variables
  Engine e;
  PImage tank, fuelLevelImage, fuelLow;
  int startCashDisplay;
  boolean showingFuelMessage = false, showingCashDisplay = false, showingLowFuel = false;
  float fuelHeight;

  //Constructor
  HUD(Engine theEngine) {
    e = theEngine;
    tank = loadImage("Fuel-icon.png");
    fuelLevelImage = loadImage("fuel-level-full.png");
    fuelLevelImage.resize((int)e.s(1000), 0);
    fuelLow = loadImage("fuelLow.png");
    fuelLow.resize(int(e.s(1000)), 0);
    startCashDisplay = millis();
  }


  void printToScreen() {
    fill(255, 0, 0);
    // Set fuel height based on current fuel and draw the rectangle inside the tank
    fuelHeight = e.player.fuel*10-10;
    fuelHeight = constrain(fuelHeight, 0, 100);
    rect(e.x(115), e.y(197-fuelHeight), e.actualSize(65), e.actualSize(fuelHeight));
    image(tank, e.actualPosition(100, 100)[0], e.actualPosition(100, 100)[1], e.actualSize(100), e.actualSize(100));
    
    // If the messeages flashed to the screen should be shown, show them. 
    if (showingFuelMessage) showFuelLevelFull();
    if (showingLowFuel) showLowFuel();
    // Calling the functions to display score and amount of money in bank.
    showScore();
    showMoneyInBank();
    
    // Display the value of the element just mined for 2 seconds. 
    if (millis() < startCashDisplay + 1000) {
      if (showingCashDisplay) {
        textSize(e.s(32));
        fill(0, 255, 0);
        text("$" + str(e.cashVal-e.prevCashVal), e.x(300), e.y(300));
      }
    } else {
      showingCashDisplay = false;
    }
  }


  // Function that flashes a fuel full message after the user fills up their gas tank
  void showFuelLevelFull() {
    if (e.currentFrame % 10 <= 3) {
      image(fuelLevelImage, e.x(0), e.y(500));
    }
  }


  // Function that flashes a low fuel message if the fuel is low
  void showLowFuel() {
    if (e.currentFrame % 10 <= 3) {
      image(fuelLow, e.x(0), e.y(400));
    }
  }


  // Function that displays the player's score to the screen
  void showScore() {
    textAlign(LEFT);
    textSize(e.s(40));
    fill(255);
    text("SCORE - " + str(e.score), e.x(50), e.y(85));
  }

 
 // Function that displays the cash value of the element just mined as well as showed the gas tank icon. The fill amount is based on how much fuel the player has left.
  void showCashVal() {
    startCashDisplay = millis();
    showingCashDisplay = true;
    textSize(32);
    fill(255, 0, 0);
  }


  // Function that displays the amount of money the player has in their bank to the screen. 
  void showMoneyInBank() {
    textSize(e.s(40));
    fill(78, 148, 85);
    text("BANK - $" + str(e.cashVal), e.x(50), e.y(40));
  }
  
}