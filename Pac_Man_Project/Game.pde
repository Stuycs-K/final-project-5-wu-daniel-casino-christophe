public class Game{
  private int highScore;
  private int gameOver;
  private int levelWin;
  private int levelDifficulty;
  private int currentState;
  private String[] ghostStates;
  private PImage PacManMapImage;
  private KeyboardBuffer keyboardInput;
  private PacMan player;
  private Ghost Blinky;
  private Ghost Pinky;
  private Ghost Inky;
  private Ghost Clyde;
  
  public Game(int[][] map){
    highScore = 0;
    player = new PacMan(map);
    ghostStates = new String[]{"scatter", "chase"};
    currentState=0;
    Blinky = new Ghost("Blinky.jpg", map, player, 377,348);
    Pinky = new Ghost("Pinky.jpg",map, player, 377,435);
    Inky = new Ghost("Inky.jpg",map, player, 348,406);
    Clyde = new Ghost("Clyde.jpg",map,player, 406,435);
    keyboardInput = new KeyboardBuffer();
    player.applyDirection("left");
    player.updateLocation();
    PacManMapImage = loadImage("PacManMapVeryFinal.jpg");
  }
  
  public void run(){
    if (ghostStates[currentState].equals("scatter")){
      Blinky.adjustState(ghostStates[currentState], Blinky.getLocation());
      Pinky.adjustState(ghostStates[currentState], Blinky.getLocation());
      Inky.adjustState(ghostStates[currentState], Blinky.getLocation());
      Clyde.adjustState(ghostStates[currentState], Blinky.getLocation());
      
    }
    
    if (ghostStates[currentState].equals("chase")){
      Blinky.adjustState(ghostStates[currentState], Blinky.getLocation());
      Pinky.adjustState(ghostStates[currentState], Blinky.getLocation());
      Inky.adjustState(ghostStates[currentState], Blinky.getLocation());
      Clyde.adjustState(ghostStates[currentState], Blinky.getLocation());
    }
    
    
   Blinky.applyDirection(Blinky.chooseDirection());
    Pinky.applyDirection(Pinky.chooseDirection());
    Inky.applyDirection(Inky.chooseDirection());
    Clyde.applyDirection(Clyde.chooseDirection());
      Blinky.showGhost();
      Pinky.showGhost();
      Inky.showGhost();
      Clyde.showGhost();
  }
  
  public void switchStates(){
    currentState++;
    if (currentState>=ghostStates.length){
      currentState=0;
    }
    
  }
  
  public void keyboardSetter(int code, boolean pressed){
    keyboardInput.press(code, pressed);
    updateKeyboard();
  }
  
  public Ghost getBlinky(){
    return Blinky;
  }
  public Ghost getInky(){
    return Inky;
  }
  public Ghost getPinky(){
    return Pinky;
  }
  public Ghost getClyde(){
    return Clyde;
  }
  
  public PacMan getPlayer(){
    return player;
  }
  
  public void update(){
    image(PacManMapImage,0,0);
    player.showPacMan();
    player.updateLocation();
    player.getCurrentTile();
  }
  
  public void updateKeyboard(){
    if (keyboardInput.P1_UP) {
      player.applyDirection("up");
    }
    //check if the button P1_RIGHT is being pressed:
    if (keyboardInput.P1_DOWN) {
      player.applyDirection("down");
    }
    //check if the button P1_LEFT is being pressed:
    if (keyboardInput.P1_LEFT) {
      player.applyDirection("left");
    }
    //check if the button P1_RIGHT is being pressed:
    if (keyboardInput.P1_RIGHT) {
      player.applyDirection("right");
    }
  }
}
