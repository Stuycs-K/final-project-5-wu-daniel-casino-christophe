Game game;
int timer;

void setup(){
  size(812, 899);
  game = new Game();
  timer = 0;
}

void draw(){
  game.run();
  timer++;
}

void keyPressed() {
  //send the number of the key pressed to your KeyboardBuffer object
  game.keyboardSetter(keyCode, true);
}
