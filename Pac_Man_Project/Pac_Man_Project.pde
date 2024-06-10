import processing.sound.*;
SoundFile intro;
SoundFile death;
SoundFile eatGhost;
SoundFile eatPellet;
Game game;
int stateTimer;
void setup(){
  size(812, 899);
  game = new Game();
  eatGhost = new SoundFile(this, "pacman_eatghost.mp3");
  death = new SoundFile(this, "pacman_death.mp3");
  intro = new SoundFile(this, "pacman_beginning.mp3");
  eatPellet = new SoundFile(this, "pacman_chomp.mp3");
  intro.play();
  stateTimer=0;
}

void draw(){
  if (game.ateSound()){
    eatGhost.play();
  }
  if (game.pelletSound()){
    eatPellet.play();
  }
  if (game.winCondition()){
    game.reset(false);
    stateTimer=0;
  }
  
  if (game.lost()){
    death.play();
    game.reset(true);
    stateTimer=0;
  }
  game.gameDraw();
  if (stateTimer%900==0&&stateTimer!=0){
    game.switchStates();
  }
  
  if (game.startTimer())
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
