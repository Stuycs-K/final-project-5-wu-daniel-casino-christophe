KeyboardBuffer keyboardInput;
PacMan currentPacMan;
Map currentMap;

void setup(){
  size(812, 899);
  keyboardInput = new KeyboardBuffer();
  currentMap = new Map();
  currentPacMan = new PacMan(currentMap.getTileMap());
  PImage PacManMapImage = loadImage("PacManMapVeryFinal.jpg");
  image(PacManMapImage,0,0);
}

void draw(){
  PImage PacManMapImage = loadImage("PacManMapFinal.jpg");
  image(PacManMapImage,0,0);
  //check if the button P1_LEFT is being pressed:
  if (keyboardInput.P1_UP) {
    currentPacMan.applyDirection("up");
  }
  //check if the button P1_RIGHT is being pressed:
  if (keyboardInput.P1_DOWN) {
    currentPacMan.applyDirection("down");
  }
  //check if the button P1_LEFT is being pressed:
  if (keyboardInput.P1_LEFT) {
    currentPacMan.applyDirection("left");
  }
  //check if the button P1_RIGHT is being pressed:
  if (keyboardInput.P1_RIGHT) {
    currentPacMan.applyDirection("right");
  }
}

void keyPressed() {
  //send the number of the key pressed to your KeyboardBuffer object
  keyboardInput.press(keyCode,true);
}
