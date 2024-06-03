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

  //Pacman for reference;
  PacMan currentUser;
  
  // change the map parameter to GridSpace  
  public Ghost(String ghostType, int[][] map, PacMan player){
    ghost = loadImage(ghostType);
    movementSpeed = 8;
    size = 29;
    ghostName = ghostType.substring(0, ghostType.length()-4);
    ghostDirection = new PVector(0,1);
    
    chaseState=false;
    scaredState=false;
    eatenState=false;
    scatteredState=true;
    
    location = new PVector(0,0);
    xvelocity = new PVector(movementSpeed,0);
    yvelocity = new PVector(0,movementSpeed);
    
    ghostMap=map;
    
    currentUser=player;
  }
  
  public void showGhost(int xCoord, int yCoord){
    image(ghost, location.x, location.y, size, size);
  }
  
  //get methods
  public String getName(){
    return ghostName;
  }

  
  public int[] getLocation(){
    int[] ghostLocation = new int[]{(int)(location.x/26),(int)(location.y/31)};
    return ghostLocation;
  }
  
  public void adjustSpeed(int newSpeed){
    movementSpeed = newSpeed;
  }
  
  public void adjustState(String state, int[] BlinkyLocation){
    removeCurrentState();
    if (state.equals("scared")){
      scaredState=true;
    }
    if (state.equals("scatter")){
      currentTarget = scatterTarget();
      scatteredState=true;
    }
    
    if (state.equals("chase")){
      currentTarget = chaseTarget(currentUser, BlinkyLocation);
      chaseState=true;
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
  
   public String chooseDirection(){
    ArrayList<String> possibleDirections = new ArrayList<String>();
    possibleDirections.add("up");
    possibleDirections.add("left");
    possibleDirections.add("down");
    possibleDirections.add("right");
    
    if (ghostDirection.x==1){
      possibleDirections.remove("left");
    }
    
    if (ghostDirection.x==-1){
      possibleDirections.remove("right");
    }
    
    if (ghostDirection.y==1){
      possibleDirections.remove("up");
    }
    
    if (ghostDirection.y==-1){
      possibleDirections.remove("down");
    }
    
    for (int i=0;i<possibleDirections.size();i++){
      
    }
    
  }

  //states of movement
  
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
  
  public int[] chaseTarget(PacMan player, int[] blinkyCoords){
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
      
      int[] adjustmentVector = new int[]{blinkyCoords[0]-target[0],blinkyCoords[1]-target[1]};
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
