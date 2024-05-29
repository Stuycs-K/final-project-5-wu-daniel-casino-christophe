int rowTiles;
int columnTiles;
KeyboardBuffer keyboardInput;
PacMan pacMan;

void setup(){
  size(980, 1260);
  rowTiles=28;
  columnTiles=36;
  keyboardInput = new KeyboardBuffer();
  pacMan = new PacMan();
  Ghost Blinky = new Ghost("Blinky.jpg");
}

void draw(){
  

  background(255);
  
  Blinky.applyDirection("right");
  circle(pacMan.x, pacMan.y, pacMan.size);
  //check if the button P1_LEFT is being pressed:
  if (keyboardInput.P1_UP) {
    rect(10, 10, 10, 10);
    pacMan.y -= 9;
  }
  //check if the button P1_RIGHT is being pressed:
  if (keyboardInput.P1_DOWN) {
    rect(30, 10, 10, 10);
    pacMan.y += 9;
  }
  //check if the button P1_LEFT is being pressed:
  if (keyboardInput.P1_LEFT) {
    rect(50, 10, 10, 10);
    pacMan.x -= 9;
  }
  //check if the button P1_RIGHT is being pressed:
  if (keyboardInput.P1_RIGHT) {
    rect(70, 10, 10, 10);
    pacMan.x += 9;
  }
  fill(0);
  text("Try pressing one or more\n of: A/D keys", 10, 50);
}

void keyPressed() {
  //send the number of the key pressed to your KeyboardBuffer object
  keyboardInput.press(keyCode,true);
}
