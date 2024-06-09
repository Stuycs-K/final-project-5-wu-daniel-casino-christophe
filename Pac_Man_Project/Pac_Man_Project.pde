Game game;

void setup(){
  size(812, 899);
  game = new Game();
}

void draw(){
  game.run();
}

void keyPressed() {
  //send the number of the key pressed to your KeyboardBuffer object
  game.keyboardSetter(keyCode, true);
}
