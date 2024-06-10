//import processing.sound.*;
//SoundFile file;
Game game;
int stateTimer;
void setup(){
  size(812, 899);
  game = new Game();
  stateTimer=0;
  //file = new SoundFile(this, "pacman_beginning.mp3");
  //file.play();
}

void draw(){
  game.gameDraw();
  if (stateTimer%900==0&&stateTimer!=0){
    game.switchStates();
  }
  stateTimer++;
}

void keyPressed() {
  //send the number of the key pressed to your KeyboardBuffer object
  if(keyCode == ENTER){
    game.enterPressed();
  } else {
    game.keyboardSetter(keyCode, true);
  }
}
