public class Ghost{
  int movementSpeed;
  int xCenter;
  int yCenter;
  int size;
  boolean scaredState;
  boolean scatteredState;
  boolean chaseState;
  boolean eatenState;
  PImage ghost;
  
  public Ghost(String ghostType){
    ghost = loadImage(ghostType);
    movementSpeed = 8;
    size = 9;
    chaseState=true;
    scaredState=false;
    eatenState=false;
    scatteredState=false;
  }
  
  public void showGhost(int xCoord, int yCoord){
    image(ghost, xCoord, yCoord, size, size);
  }
  
  
  public void adjustSpeed(int newSpeed){
    movementSpeed = newSpeed;
  }
  
  public void adjustState(String state){
    if (state.equals("scared")){
      scaredState=true;
    }
    if (state.equals("scatter")){
      scatteredState=true;
    }
    
    if (state.equals("chase")){
      scaredState=true;
    }
    
    if (state.equals("eaten")){
      eatenState=true;
    }
  }
  
  public void removeCurrentState(){
    scaredState=false;
    scatteredState=false;
    chaseState=false;
    eatenState=false;
  }
  
  public void applyDirection(String direction){
    if (direction.equals("left")){
      xCenter-=movementSpeed;
    }
    
    if (direction.equals("right")){
      xCenter+=movementSpeed;
    }
    
    if (direction.equals("up")){
      yCenter+=movementSpeed;
    }
    
    if (direction.equals("down")){
      yCenter-=movementSpeed;
    }
    
    
  }
}
