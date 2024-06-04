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
  private PVector xvelocity;
  private PVector yvelocity;
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
    xvelocity = new PVector(movementSpeed,0);
    yvelocity = new PVector(0,movementSpeed);
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
    return PacManLocation;
  }
  
  public void showPacMan(){
    image(PacManImage, location.x, location.y, size, size);
  }
  
  public void applyDirection(String direction){
    if (direction.equals("left")){
      location.sub(xvelocity);
      PacManDirection = new PVector(-1,0);
    }
    
    if (direction.equals("right")){
      location.add(xvelocity);
      PacManDirection = new PVector(1,0);
    }
    
    if (direction.equals("up")){
      location.add(yvelocity);
      PacManDirection = new PVector(0,1);
    }
    
    if (direction.equals("down")){
      location.sub(yvelocity);
      PacManDirection = new PVector(0,-1);
    }
    
    showPacMan();
  }
}
