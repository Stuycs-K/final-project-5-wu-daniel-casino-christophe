public class Ghost{
  // PVectors dictate the movement and the direction of ghosts
  private PVector location;
  private PVector xvelocity;
  private PVector yvelocity;
  private PVector ghostDirection;
  
  //Physical Properties of the Ghosts
  private int movementSpeed;
  private int size;
  private String ghostName;
  private PImage ghost;
  
  //States of Ghosts
  private boolean scaredState;
  private boolean scatteredState;
  private boolean chaseState;
  private boolean eatenState;
  
  //map for ghosts
  private int[][] ghostMap;
  
  //targeting system for ghost
  private int[] currentTarget;

  // change the map parameter to GridSpace  
  public Ghost(String ghostType, int[][] map){
    ghost = loadImage(ghostType);
    movementSpeed = 8;
    size = 9;
    ghostName = ghostType.substring(0, ghostType.length()-4);
    
    chaseState=false;
    scaredState=false;
    eatenState=false;
    scatteredState=true;
    
    location = new PVector(0,0);
    xvelocity = new PVector(movementSpeed,0);
    yvelocity = new PVector(0,movementSpeed);
    
    ghostMap=map;
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
      ghostDirection = new PVector(-1,0);
    }
    
    if (direction.equals("right")){
      location.add(xvelocity);
      ghostDirection = new PVector(1,0);
    }
    
    if (direction.equals("up")){
      location.add(yvelocity);
      ghostDirection = new PVector(0,1);
    }
    
    if (direction.equals("down")){
      location.sub(yvelocity);
      ghostDirection = new PVector(0,-1);
    }
    
    showGhost((int)location.x,(int) location.y);
  }
  
  //get methods
  public String getName(){
    return ghostName;
  }

  //states of movement
  public void applyScatter(){}
  
  public void scatterTarget(){
  
  }
  public void applyChase(){}
  
  public void applyEaten(){}
  
  public void applyScared(){}
  

}
