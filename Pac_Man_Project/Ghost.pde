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
  
  public int[] getLocation(){
    int[] location = new int[]{location.x,location.y};
    return location;
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
  public void applyState(String state){
    removeCurrentState();
    if (state.equals("Scatter")){
      scatteredState=true;
      currentTarget=scatterTarget();
    }
    
    if (state.equals("Scared")){
      scaredState=true;
      currentTarget=scatterTarget();
    }
    
    if (state.equals("Chase")){
      chaseState=true;
      currentTarget=scatterTarget();
    }
    
    if (state.equals("Eaten")){
      eatenState=true;
      currentTarget=scatterTarget();
    }
    
  }
  
  public int[] scatterTarget(){
    if (ghostName.equals("Pinky")){
      int[] target = new int[]{0,0};
      return target;
    }
    
    if (ghostName.equals("Blinky")){
      int[] target = new int[]{27,0};
      return target;
    }
    
    if (ghostName.equals("Inky")){
      int[] target = new int[]{27,30};
      return target;
    }
    
    else{
      int[] target = new int[]{0,30};
      return target;
    }
    
    
  }
  
  public int[] chaseTarget(PacMan player, Ghost blinky){
    if (ghostName.equals("Pinky")){
      int[] target = player.getCurrentTile();
      String direction = player.getPacManDirection();
      if (direction.equals("left")){
        target[0]-=4;
        if (target[0]<0){
          target[0]=0;
        }
        return target;
      }
      
      if (direction.equals("right")){
        target[0]+=4;
        if (target[0]>27){
          target[0]=27;
        }
        return target;
      }
      
      if (direction.equals("up")){
        target[1]-=4;
        if (target[1]<0){
          target[1]=0;
        }
        return target;
      }
      
      target[1]+=4;
      if(target[1]>30){
        target[1]=30;
      }
      return target;
    }
    
    if (ghostName.equals("Blinky")){
      return player.getCurrentTile();
    }
    
    if (ghostName.equals("Inky")){
      int[] target = player.getCurrentTile;
      int[] blinkyLocation = blinky.getLocation();
      String direction = player.getPacManDirection();
      
      if (direction.equals("left")){
        target[0]-=2;
        if (target[0]<0){
          target[0]=0;
        }
      }
      
      if (direction.equals("right")){
        target[0]+=2;
        if (target[0]>27){
          target[0]=27;
        }
      }
      
      if (direction.equals("up")){
        target[1]-=2;
        if (target[1]<0){
          target[1]=0;
        }
      }
      
      target[1]+=2;
      if(target[1]>27){
        target[1]=27;
      }
      
      int[] adjustmentVector = new int[]{blinkyLocation[0]-target[0],blinkyLocation[1]-target[1]};
      target[0]-=adjustmentVector[0];
      target[1]-=adjustmentVector[1];
      
      if (target[0]<0){
        target[0]=0;
      }
      if (target[0]>27){
        target[0]=27;
      }
      if (target[1]<0){
        target[1]=0;
      }
      if (target[1]>30){
        target[1]=30;
      }
      return target;
    }
    
    int[] pacLocation = player.getCurrentTile();
    int[] ghostLocation = getLocation();
    int distanceFromPacMan = Math.sqrt(Math.pow((pacLocation[0]-ghostLocation[0]),2) + Math.pow((pacLocation[1]-ghostLocation[1]),2));
    if (distanceFromPacMan>=8){
      return pacLocation;
    }
    else{
      return scatterTarget();
    }
    
    
    
  }
 
  

}
