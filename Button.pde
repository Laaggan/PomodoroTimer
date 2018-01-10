class Button {
  int posX;
  int posY;
  int sizeX; 
  int sizeY;
  Button(int posX, int posY, int sizeX, int sizeY) {
    this.posX = posX;
    this.posY = posY;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    rect(posX, posY, sizeX, sizeY);
  }

  void drawButton() {
    rect(posX, posY, sizeX, sizeY);
  }

  boolean CheckButtonPressed() {
    if (mouseX > posX && mouseX < posX + sizeX && mouseY > posY && mouseY < posY + sizeY) {
      if (mousePressed) {
        return true;
      }
    }
    return false;
  }
}