Map currentMap;
Game game;
int timer;

void setup(){
  size(812, 899);
  currentMap = new Map();
  game = new Game(currentMap.getTileMap());
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
