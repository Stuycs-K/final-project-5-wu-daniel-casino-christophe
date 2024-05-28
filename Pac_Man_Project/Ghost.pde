public class Ghost{
  int movementSpeed;
  int size;
  boolean scaredState;
  boolean scatteredState;
  boolean chaseState;
  PImage ghost;
  
  public Ghost(String ghostType){
    ghost = loadImage(ghostType);
    movementSpeed = 8;
    size = 9;
    
  }
  
  public void showGhost(int xCoord, int yCoord){
    image(ghost, xCoord, yCoord, size, size);
  }
  
}
