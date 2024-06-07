import java.util.*;
public class PacMan{
  KeyboardBuffer keyboardInput;
  int movementSpeed;
  int size;
  int score;
  Boolean alive;
  Boolean addedLife;
  int lifeCount;
  Boolean activeState;
  int ghostsConsumed;
  private int[][] PacManMap;
  private PVector location;
  private PVector PacManDirection;
  private PImage PacManImage;
  
  public PacMan(int[][] map){
    keyboardInput = new KeyboardBuffer();
    movementSpeed = 8;
    lifeCount = 3;
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
  
  public int[] getCurrentTile(){
    int[] PacManLocation = new int[]{(int)(location.x/28),(int)(location.y/31)};
    println(Arrays.toString(PacManLocation));
    return PacManLocation;
  }
  
  public int getAnyTileNumber(int x, int y){
    int[] tileLocation = new int[]{(int)x/28, (int)y/31};
    return PacManMap[tileLocation[0]][tileLocation[1]];
  }
  
  public void showPacMan(){
    image(PacManImage, location.x, location.y, size, size);
  }
  
  public void updateLocation(){
    PVector temp = PVector.add(location, PacManDirection);
    if(PacManDirection.equals(new PVector(0,-7))){
      if(getAnyTileNumber((int)temp.x, (int)temp.y) != 0){
        location.add(PacManDirection);
      }
    }
    if(PacManDirection.equals(new PVector(0,7))){
      if(getAnyTileNumber((int)temp.x, (int)temp.y + 29) != 0){
        location.add(PacManDirection);
      }
    }
    if(PacManDirection.equals(new PVector(-7,0))){
      if(getAnyTileNumber((int)temp.x, (int)temp.y) != 0){
        location.add(PacManDirection);
      }
    }
    if(PacManDirection.equals(new PVector(7,0))){
      if(getAnyTileNumber((int)temp.x + 29, (int)temp.y) != 0){
        location.add(PacManDirection);
      }
    }
  }
  
  public void applyDirection(String direction){
    if (direction.equals("up")){
      PacManDirection = new PVector(0,-7);
    }
    if (direction.equals("down")){
      PacManDirection = new PVector(0,7);
    }
    if (direction.equals("left")){
      PacManDirection = new PVector(-7,0);
    }
    if (direction.equals("right")){
      PacManDirection = new PVector(7,0);
    }
    showPacMan();
  }
}
