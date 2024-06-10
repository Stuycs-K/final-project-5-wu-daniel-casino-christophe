import java.util.Arrays;
public class PacMan{
  KeyboardBuffer keyboardInput;
  int movementSpeed;
  int size;
  int score;
  int lifeCount;
  int ghostsConsumed;
  Boolean alive;
  Boolean addedLife;
  Boolean activeState;
  PImage closedPacManImageUp;
  PImage closedPacManImageDown;
  PImage closedPacManImageLeft;
  PImage closedPacManImageRight;
  PImage openPacManImageUp;
  PImage openPacManImageDown;
  PImage openPacManImageLeft;
  PImage openPacManImageRight;
  PVector location;
  private int[][] PacManMap;
  private PVector PacManDirection;
  
  public PacMan(int[][] map, int lives){
    keyboardInput = new KeyboardBuffer();
    movementSpeed = 5;
    lifeCount = lives;
    score = 0;
    size = 29;
    addedLife = false;
    PacManDirection = new PVector(0,1);
    closedPacManImageUp = loadImage("closedPacManImageUp.png");
    closedPacManImageDown = loadImage("closedPacManImageDown.png");
    closedPacManImageLeft = loadImage("closedPacManImageLeft.png");
    closedPacManImageRight = loadImage("closedPacManImageRight.png");
    openPacManImageUp = loadImage("openPacManImageUp.png");
    openPacManImageDown = loadImage("openPacManImageDown.png");
    openPacManImageLeft = loadImage("openPacManImageLeft.png");
    openPacManImageRight = loadImage("openPacManImageRight.png");
    PacManMap=map;
    moveToStart();
  }
  
  public int getLives(){
    return lifeCount;
  }
  
  public int getScore(){
    return score;
  }
  
  public void pellet(int pelletType){
    if(pelletType == 2){
      score += 10;
    } else if(pelletType == 3){
      score += 50;
    }
  }
  
  public void addLife(){
    if(getScore() > 10000 && !addedLife){
      lifeCount++;
      addedLife = true;
    }
  }
  
  public void subtractLife(){
    lifeCount--;
  }
  
  public int getConsumedGhosts(){
    return ghostsConsumed;
  }
  
  public String getPacManDirection(){
    return keyboardInput.getLastDirection();
  }
  
  public int[] getCurrentTile(){
    int[] PacManLocation = new int[]{(int)(location.x/29),(int)(location.y/29)};
    return PacManLocation;
  }
  
  public void updateLocation(){    
    if(PacManDirection.equals(new PVector(0,-5))){
      if(PacManMap[getCurrentTile()[1] - 1][getCurrentTile()[0]] != 0){
        location.add(PacManDirection);
      }
    } else if(PacManDirection.equals(new PVector(0,5))){
      if(PacManMap[getCurrentTile()[1] + 1][getCurrentTile()[0]] != 0){
        location.add(PacManDirection);
      }
    } else if(PacManDirection.equals(new PVector(-5,0))){
      if(PacManMap[getCurrentTile()[1]][getCurrentTile()[0] - 1] != 0){
        location.add(PacManDirection);
      }
      if(PacManMap[getCurrentTile()[1]][getCurrentTile()[0] - 1] == 5){
        location.set(807, 430);
      }
    } else if(PacManDirection.equals(new PVector(5,0))){
      if(PacManMap[getCurrentTile()[1]][getCurrentTile()[0] + 1] != 0){
        location.add(PacManDirection);
      }
      if(PacManMap[getCurrentTile()[1]][getCurrentTile()[0] + 1] == 6){
        location.set(5, 430);
      }
    }
  }
  
  public void applyDirection(String direction){
    if (direction.equals("up")){
       if(PacManMap[getCurrentTile()[1] - 1][getCurrentTile()[0]] != 0){
        PacManDirection = new PVector(0,-5);
      }
    } else if (direction.equals("down")){
       if(PacManMap[getCurrentTile()[1] + 1][getCurrentTile()[0]] != 0){
        PacManDirection = new PVector(0,5);
      }
    } else if (direction.equals("left")){
       if(PacManMap[getCurrentTile()[1]][getCurrentTile()[0] - 1] != 0){
        PacManDirection = new PVector(-5, 0);
      }
    } else if (direction.equals("right")){
       if(PacManMap[getCurrentTile()[1]][getCurrentTile()[0] + 1] != 0){
        PacManDirection = new PVector(5,0);
      }
    }
  }
  
  public void moveToStart(){
    location = new PVector(417,667);
  }
}
