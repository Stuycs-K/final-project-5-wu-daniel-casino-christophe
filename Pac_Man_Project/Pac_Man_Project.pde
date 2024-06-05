KeyboardBuffer keyboardInput;
PacMan currentPacMan;
Map currentMap;
Game startup;
int timer;
PImage PacManMapImage;
Ghost Blinky;
void setup(){
  size(812, 899);
  keyboardInput = new KeyboardBuffer();
  currentMap = new Map();
  currentPacMan = new PacMan(currentMap.getTileMap());
  PacManMapImage =   loadImage("PacManMapVeryFinal.jpg");
  Blinky = new Ghost("Blinky.jpg",currentMap.getTileMap(), currentPacMan,0,0);
  
  startup = new Game(currentMap.getTileMap());
  timer = 0;
}

void draw(){
  image(PacManMapImage,0,0);
  currentPacMan.showPacMan();
  println("Hello");
  //check if the button P1_LEFT is being pressed:
  
  startup.run();
  if (timer%10==0&&timer!=0){
    startup.switchStates();
  }
  timer++;
}

void keyPressed() {
  //send the number of the key pressed to your KeyboardBuffer object
  keyboardInput.press(keyCode,true);
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
