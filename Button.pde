//This class is created to make it easier to make buttons and that each button will have a separate button pressed function

class Button {
  int posX;
  int posY;
  int sizeX; 
  int sizeY;
  String buttonText;
  Button(int posX, int posY, int sizeX, int sizeY, String buttonText) {
    this.posX = posX;
    this.posY = posY;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.buttonText = buttonText;
    rect(posX, posY, sizeX, sizeY);
    PFont font;
    font = createFont("OpenSans-Regular.ttf", 32);
    textFont(font);
  }

  void drawButton() {
    fill(150);
    rect(posX, posY, sizeX, sizeY);
    fill(255);
    text(buttonText, posX + 8, posY + 32, 32);
  }

  boolean CheckButtonPressed() {
    if (mouseX > posX && mouseX < posX + sizeX && mouseY > posY && mouseY < posY + sizeY) {
        return true;
    }
    return false;
  }
}