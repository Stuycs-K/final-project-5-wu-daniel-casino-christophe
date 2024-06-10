//import processing.sound.*;
//SoundFile file;
Game game;
int stateTimer;
void setup(){
  size(812, 899);
  game = new Game();
  //file = new SoundFile(this, "pacman_beginning.mp3");
  //file.play();
  stateTimer=0;
}

void draw(){
  if (game.winCondition()){
    game.reset(false);
    stateTimer=0;
  }
  
  if (game.lost()){
    game.reset(true);
    stateTimer=0;
  }
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
