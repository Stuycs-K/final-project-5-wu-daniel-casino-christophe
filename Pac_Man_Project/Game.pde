import java.util.ArrayList;
import java.util.Arrays;

public class Game{
  int timer;
  boolean startScreenActive;
  boolean endScreenActive;
  private boolean allPelletsEaten;
  private int score;
  private int scoreDiff;
  private int highScore;
  private boolean gameLost;
  private int superTimer;
  private int currentState;
  private int ghostsEaten;
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
    gameLost=false;
    superTimer = 0;
    timer = 0;
    highScore = 0;
    scoreDiff = 0;
    currentState = 0;
    ghostsEaten = 0;
    startScreenActive = true;
    endScreenActive = false;
    currentMap = new Map();
    keyboardInput = new KeyboardBuffer();
    PacManMapImage = loadImage("PacManMapVeryFinal.jpg");
    player = new PacMan(currentMap.tileMap, 3);
    score = player.getScore();
    ghostStates = new String[]{"scatter", "chase"};
    Blinky = new Ghost("Blinky.png", currentMap.tileMap, player, 377, 348);
    Pinky = new Ghost("Pinky.png", currentMap.tileMap, player, 377, 435);
    Inky = new Ghost("Inky.png", currentMap.tileMap, player, 362, 435);
    Clyde = new Ghost("Clyde.png", currentMap.tileMap, player, 406, 435);
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
  
  public boolean lost(){
    return gameLost;
  }
  public boolean winCondition(){
    return allPelletsEaten;
  }
  public void reset(boolean death){
    if (death){
      player.subtractLife();
      gameLost=false;
    }
    if (!death){
      currentMap = new Map();
    }
    currentMap.pinkOpen();
    keyboardInput = new KeyboardBuffer();
    superTimer=0;
    scoreDiff=0;
    ghostsEaten=0;
    player.moveToStart();
    Blinky = new Ghost("Blinky.png", currentMap.tileMap, player, 377, 348);
    Pinky = new Ghost("Pinky.png", currentMap.tileMap, player, 377, 435);
    Inky = new Ghost("Inky.png", currentMap.tileMap, player, 362, 435);
    Clyde = new Ghost("Clyde.png", currentMap.tileMap, player, 406, 435);
    player.applyDirection("left");
    player.updateLocation();
    timer=0;
    allPelletsEaten=false;
  }
  public void run(){
    if(player.getLives() != 0){
      timer++;
      image(PacManMapImage,0,0);
      allPelletsEaten = true;
      for(int i = 0; i < currentMap.getRowTiles(); i++){
        for(int j = 0; j < currentMap.getColumnTiles(); j++){
          if(currentMap.tileMap[j][i] == 2){
            fill(255, 255, 0);
            circle(i * 29 + 14, j * 29 + 14, 10);
            allPelletsEaten = false;
          }
          if(currentMap.tileMap[j][i] == 3){
            fill(255, 255, 0);
            circle(i * 29 + 14, j * 29 + 14, 20);
            allPelletsEaten = false;
          }
        }
      }
      
      
      if(timer < 150){
        fill(229, 204, 201);
        textSize(56);
        text("READY!", 320, 440);
      } else {
        
        if (scoreDiff==50){
          superTimer=300;
          ghostsEaten=0;
        }
        if (superTimer==0||Blinky.returnHome()){
          Blinky.adjustState(ghostStates[currentState], Blinky.getLocation());
          
        } else{
          if (!(Blinky.getState().equals("eaten"))&&!Clyde.revenge()){
            Blinky.adjustState("scared",Blinky.getLocation());
          } else{
            Blinky.adjustState("eaten", Blinky.getLocation());
          }
            
          }
          
        if (superTimer==0||Pinky.returnHome()){
          Pinky.adjustState(ghostStates[currentState], Blinky.getLocation());
        } else{
          if (!(Pinky.getState().equals("eaten"))&&!Pinky.revenge()){
            Pinky.adjustState("scared", Blinky.getLocation());
          }else{
            Pinky.adjustState("eaten", Blinky.getLocation());
          }
        }
        
        
        
        if (Inky.outOfBox()){
          if (superTimer==0||Inky.returnHome()){
            Inky.adjustState(ghostStates[currentState], Blinky.getLocation());
          }else{
            if (!(Inky.getState().equals("eaten"))&&!Inky.revenge()){
              Inky.adjustState("scared", Blinky.getLocation());
            } else{
              Inky.adjustState("eaten", Blinky.getLocation());
            }
            
          }  
        } else{
          Inky.escapeBox();
        }
        
        if (Clyde.outOfBox()){
          if (superTimer==0||Clyde.returnHome()){
            Clyde.adjustState(ghostStates[currentState], Blinky.getLocation());
          } else{
            if (!(Clyde.getState().equals("eaten"))&&!Clyde.revenge()){
              Clyde.adjustState("scared", Blinky.getLocation());
            } else{
              Clyde.adjustState("eaten", Blinky.getLocation());
            }
            
          }
        } else{
          Clyde.escapeBox();
        }
       
       if (Clyde.outOfBox()&&Inky.outOfBox()){
         currentMap.pinkBlock();
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
        text("Score", 30, 325);
        scoreDiff=player.getScore()-score;
        score=player.getScore();
        text("" + player.getScore(), 49, 360);
        
        fill(226, 223, 210);
        textSize(40);
        text("Lives", 689, 325);
        text("" + player.getLives(), 719, 360);
        
        player.updateLocation();
        player.getCurrentTile();
        player.addLife();
        showPacMan();
        pelletCollision();
        if(ghostCollision()){
          gameLost=true;
        }
      }
    } else {
      endScreenActive = true;
    }
    if (superTimer>0){
      superTimer--;
    }
    if (superTimer==0){
      Blinky.resetPellet();
      Pinky.resetPellet();
      Inky.resetPellet();
      Clyde.resetPellet();
      ghostsEaten=0;
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
        
        if (g.getState().equals("scared")){
          g.adjustState("eaten", Blinky.getLocation());
          g.preventEat();
          ghostsEaten++;
          player.pellet((int)(Math.pow(2,ghostsEaten)*100));
          return false;
        }
        
        if (g.getState().equals("eaten")){
          return false;
        }
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
      if(player.PacManDirection.equals(new PVector(0,-5))){
        image(player.closedPacManImageUp, player.location.x - 14, player.location.y - 14, player.size, player.size);
      }
      if(player.PacManDirection.equals(new PVector(0,5))){
        image(player.closedPacManImageDown, player.location.x - 14, player.location.y - 14, player.size, player.size);
      }
      if(player.PacManDirection.equals(new PVector(-5,0))){
        image(player.closedPacManImageLeft, player.location.x - 14, player.location.y - 14, player.size, player.size);
      }
      if(player.PacManDirection.equals(new PVector(5,0))){
        image(player.closedPacManImageRight, player.location.x - 14, player.location.y - 14, player.size, player.size);
      }
    } else {
      if(player.PacManDirection.equals(new PVector(0,-5))){
        image(player.openPacManImageUp, player.location.x - 14, player.location.y - 14, player.size, player.size);
      }
      if(player.PacManDirection.equals(new PVector(0,5))){
        image(player.openPacManImageDown, player.location.x - 14, player.location.y - 14, player.size, player.size);
      }
      if(player.PacManDirection.equals(new PVector(-5,0))){
        image(player.openPacManImageLeft, player.location.x - 14, player.location.y - 14, player.size, player.size);
      }
      if(player.PacManDirection.equals(new PVector(5,0))){
        image(player.openPacManImageRight, player.location.x - 14, player.location.y - 14, player.size, player.size);
      }
    }
  }
  
  public void drawStartScreen(){
    background(1);
    fill(279, 2, 2);
    textSize(50);
    text("Welcome to Pac-Man", 170, 300);
    fill(229, 204, 201);
    textSize(50);
    text("Press ENTER to Start Game", 130, 600);
  }
  
  public void drawEndScreen(){
    image(PacManMapImage,0,0);
    fill(158, 27, 50);
    textSize(50);
    text("Game", 13, 525);
    textSize(54);
    text("Over", 689, 525);
    fill(229, 204, 201);
    textSize(50);
    text("Press ENTER to Restart Game", 100, 435);
  }
}
