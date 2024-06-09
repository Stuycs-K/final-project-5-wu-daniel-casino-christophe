import java.util.ArrayList;
public class Game{
  int timer;
  boolean startScreenActive;
  boolean endScreenActive;
  private int highScore;
  private int gameOver;
  private int levelWin;
  private int levelDifficulty;
  private int currentState;
  private String[] ghostStates;
  private PImage PacManMapImage;
  private Map currentMap;
  private KeyboardBuffer keyboardInput;
  private PacMan player;
  private Ghost Blinky;
  private Ghost Pinky;
  private Ghost Inky;
  private Ghost Clyde;
  
  public Game(){
    initialize();
  }
  
  public void initialize(){
    timer = 0;
    highScore = 0;
    currentState = 0;
    startScreenActive = true;
    endScreenActive = false;
    currentMap = new Map();
    keyboardInput = new KeyboardBuffer();
    PacManMapImage = loadImage("PacManMapVeryFinal.jpg");
    player = new PacMan(currentMap.tileMap, 3);
    ghostStates = new String[]{"scatter", "chase"};
    Blinky = new Ghost("Blinky.jpg", currentMap.tileMap, player, 377, 348);
    Pinky = new Ghost("Pinky.jpg", currentMap.tileMap, player, 377, 435);
    Inky = new Ghost("Inky.jpg", currentMap.tileMap, player, 348, 406);
    Clyde = new Ghost("Clyde.jpg", currentMap.tileMap, player, 406, 435);
    player.applyDirection("left");
    player.updateLocation();
  }
  
  public void gameDraw(){
    if(startScreenActive){
      drawStartScreen();
    } else if (endScreenActive){
      drawEndScreen();
    } else {
      run();
    }
  }
  
  public void enterPressed(){
    startScreenActive = false;
    if(endScreenActive){
      initialize();
    }
  }
  
  public void drawStartScreen(){
    background(0);
  }
  
  public void run(){
    if(player.getLives() != 0){
      timer++;
      image(PacManMapImage,0,0);
      for(int i = 0; i < currentMap.getRowTiles(); i++){
        for(int j = 0; j < currentMap.getColumnTiles(); j++){
          if(currentMap.tileMap[j][i] == 2){
            fill(255, 255, 0);
            circle(i * 29 + 14, j * 29 + 14, 10);
          }
          if(currentMap.tileMap[j][i] == 3){
            fill(255, 255, 0);
            circle(i * 29 + 14, j * 29 + 14, 20);
          }
        }
      }
      
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
      
      fill(226, 223, 210);
      textSize(40);
      text("Score", 34, 325);
      text("" + player.getScore(), 38, 358);
      
      fill(226, 223, 210);
      textSize(40);
      text("Lives", 812 - 100, 325);
      text("" + player.getLives(), 812 - 108, 358);
      
      player.updateLocation();
      player.getCurrentTile();
      showPacMan();
      pelletCollision();
      if(ghostCollision()){
        player.subtractLife();
        player.moveToStart();
      }
    } else {
      endScreenActive = true;
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
  
  public Boolean ghostCollision(){
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
  
  public void pelletCollision(){
    int tileType = currentMap.tileMap[player.getCurrentTile()[1]][player.getCurrentTile()[0]];
    if((tileType == 2) || (tileType == 3)){
      player.pellet(tileType);
      currentMap.tileMap[player.getCurrentTile()[1]][player.getCurrentTile()[0]] = 1;
    }
  }
  
  public void showPacMan(){
    if(timer % 3 == 0){
      if(player.PacManDirection.equals(new PVector(0,-7))){
        image(player.closedPacManImageUp, player.location.x - 14, player.location.y - 14, player.size, player.size);
      }
      if(player.PacManDirection.equals(new PVector(0,7))){
        image(player.closedPacManImageDown, player.location.x - 14, player.location.y - 14, player.size, player.size);
      }
      if(player.PacManDirection.equals(new PVector(-7,0))){
        image(player.closedPacManImageLeft, player.location.x - 14, player.location.y - 14, player.size, player.size);
      }
      if(player.PacManDirection.equals(new PVector(7,0))){
        image(player.closedPacManImageRight, player.location.x - 14, player.location.y - 14, player.size, player.size);
      }
    } else {
      if(player.PacManDirection.equals(new PVector(0,-7))){
        image(player.openPacManImageUp, player.location.x - 14, player.location.y - 14, player.size, player.size);
      }
      if(player.PacManDirection.equals(new PVector(0,7))){
        image(player.openPacManImageDown, player.location.x - 14, player.location.y - 14, player.size, player.size);
      }
      if(player.PacManDirection.equals(new PVector(-7,0))){
        image(player.openPacManImageLeft, player.location.x - 14, player.location.y - 14, player.size, player.size);
      }
      if(player.PacManDirection.equals(new PVector(7,0))){
        image(player.openPacManImageRight, player.location.x - 14, player.location.y - 14, player.size, player.size);
      }
    }
  }
  
  public void drawEndScreen(){
    image(PacManMapImage,0,0);
  }
}
