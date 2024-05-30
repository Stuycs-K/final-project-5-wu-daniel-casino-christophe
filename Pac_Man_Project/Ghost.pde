public class Ghost{
  private int movementSpeed;
  PVector location;
  PVector xvelocity;
  PVector yvelocity;
  private int size;
  private boolean scaredState;
  private boolean scatteredState;
  private boolean chaseState;
  private boolean eatenState;
  private PImage ghost;
  
  public Ghost(String ghostType){
    ghost = loadImage(ghostType);
    movementSpeed = 8;
    size = 9;
    chaseState=true;
    scaredState=false;
    eatenState=false;
    scatteredState=false;
    location = new PVector(0,0);
    xvelocity = new PVector(movementSpeed,0);
    yvelocity = new PVector(0,movementSpeed);
  }
  
  public void showGhost(int xCoord, int yCoord){
    image(ghost, location.x, location.y, size, size);
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
      location.sub(xvelocity);
    }
    
    if (direction.equals("right")){
      location.add(xvelocity);
    }
    
    if (direction.equals("up")){
      location.add(yvelocity);
    }
    
    if (direction.equals("down")){
      location.sub(yvelocity);
    }
    
    showGhost((int)location.x,(int) location.y);
  }
  

}
