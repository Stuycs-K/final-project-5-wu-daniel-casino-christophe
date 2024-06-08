import java.util.*;
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
  private int[][] PacManMap;
  private PVector location;
  private PVector PacManDirection;
  private PImage PacManImage;
  
  public PacMan(int[][] map, int lives){
    keyboardInput = new KeyboardBuffer();
    movementSpeed = 8;
    lifeCount = lives;
    score = 0;
    size = 29;
    addedLife = false;
    PacManDirection = new PVector(0,1);
    location = new PVector(388,667);
    PacManImage = loadImage("ClosedMouthFinal.jpg");
    PacManMap=map;
  }
  
  public int getLives(){
    return lifeCount;
  }
  
  public void pellet(Boolean sPellet){
    if(sPellet){
      score += 50;
    } else {
      score += 10;
    }
  }
  
  public int getScore(){
    return score;
  }
  
  public void addLife(){
    if(getScore() > 10000 && !addedLife){
      lifeCount++;
      addedLife = true;
    }
  }
  
  public void subtractLife(){
    //if(true== == !Scared){}
  }
  
  public int getConsumedGhosts(){
    return ghostsConsumed;
  }
  
  public String getPacManDirection(){
    return keyboardInput.getLastDirection();
  }
  
  public void showPacMan(){
    image(PacManImage, location.x - 14, location.y - 14, size, size);
  }
  
  public int[] getCurrentTile(){
    int[] PacManLocation = new int[]{(int)(location.x/29),(int)(location.y/29)};
    println("gCT" + Arrays.toString(PacManLocation));
    println("direction" + PacManDirection);
    return PacManLocation;
  }
  
  public void updateLocation(){    
    if(PacManDirection.equals(new PVector(0,-7))){
      if(PacManMap[getCurrentTile()[1] - 1][getCurrentTile()[0]] != 0){
        location.add(PacManDirection);
      }
    } else if(PacManDirection.equals(new PVector(0,7))){
      if(PacManMap[getCurrentTile()[1] + 1][getCurrentTile()[0]] != 0){
        location.add(PacManDirection);
      }
    } else if(PacManDirection.equals(new PVector(-7,0))){
      if(PacManMap[getCurrentTile()[1]][getCurrentTile()[0] - 1] != 0){
        location.add(PacManDirection);
      }
      if(PacManMap[getCurrentTile()[1]][getCurrentTile()[0] - 1] == 5){
        location.set(807, 430);
      }
    } else if(PacManDirection.equals(new PVector(7,0))){
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
        PacManDirection = new PVector(0,-7);
      }
    } else if (direction.equals("down")){
       if(PacManMap[getCurrentTile()[1] + 1][getCurrentTile()[0]] != 0){
        PacManDirection = new PVector(0,7);
      }
    } else if (direction.equals("left")){
       if(PacManMap[getCurrentTile()[1]][getCurrentTile()[0] - 1] != 0){
        PacManDirection = new PVector(-7, 0);
      }
    } else if (direction.equals("right")){
       if(PacManMap[getCurrentTile()[1]][getCurrentTile()[0] + 1] != 0){
        PacManDirection = new PVector(7,0);
      }
    }
    showPacMan();
  }
}
