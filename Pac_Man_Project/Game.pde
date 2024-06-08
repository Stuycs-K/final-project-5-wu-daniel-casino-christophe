import java.util.ArrayList;
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
    currentState = 0;
    PacManMapImage = loadImage("PacManMapVeryFinal.jpg");
    player = new PacMan(map, 3);
    ghostStates = new String[]{"scatter", "chase"};
    Blinky = new Ghost("Blinky.jpg", map, player, 377,348);
    Pinky = new Ghost("Pinky.jpg",map, player, 377,435);
    Inky = new Ghost("Inky.jpg",map, player, 348,406);
    Clyde = new Ghost("Clyde.jpg",map,player, 406,435);
    keyboardInput = new KeyboardBuffer();
    player.applyDirection("left");
    player.updateLocation();
  }
  
  public void run(){
    image(PacManMapImage,0,0);
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
    println("ghost?");
      
    player.showPacMan();
    player.updateLocation();
    player.getCurrentTile();
    if(collision()){
      player.subtractLife();
      player.moveToStart();
    }
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
  
  public Boolean collision(){
    ArrayList<Ghost> ghostList = new ArrayList<Ghost>();
    ghostList.add(Blinky);
    ghostList.add(Inky);
    ghostList.add(Pinky);
    ghostList.add(Clyde);
    for(Ghost g: ghostList){
      if((g.getLocation()[0] == player.getCurrentTile()[0]) && (g.getLocation()[1] == player.getCurrentTile()[1])){
        return true;
      }
    }
    return false;
  }
}
