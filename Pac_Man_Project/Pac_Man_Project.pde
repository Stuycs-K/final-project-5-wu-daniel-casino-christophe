import processing.sound.*;
SoundFile file;
Game game;

void setup(){
  size(812, 899);
  game = new Game();
  file = new SoundFile(this, "sample.mp3");
  file.play();
}

void draw(){
  game.gameDraw();
}

void keyPressed() {
  //send the number of the key pressed to your KeyboardBuffer object
  if(keyCode == ENTER){
    game.enterPressed();
  } else {
    game.keyboardSetter(keyCode, true);
  }
}
