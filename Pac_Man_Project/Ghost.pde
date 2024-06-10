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
  private boolean outBox;
  
  //map for ghosts
  private int[][] ghostMap;
  
  //targeting system for ghost
  private int[] currentTarget;
  private int[] randomTarget;
  private int[] eatenTarget;
  //Pacman for reference;
  PacMan currentUser;
  
  // change the map parameter to GridSpace  
  public Ghost(String ghostType, int[][] map, PacMan player, int xCoord, int yCoord){
    ghost = loadImage(ghostType);
    movementSpeed = 2;
    size = 36;
    ghostName = ghostType.substring(0, ghostType.length()-4);
    if (ghostName.equals("Blinky")||ghostName.equals("Pinky")){
      ghostDirection = new PVector(0,-1);
    } else{
        if (ghostName.equals("Inky")){
          ghostDirection = new PVector(1,0);
        }
        else{
          ghostDirection = new PVector(1,0);
        }
    }
    
    chaseState=false;
    scaredState=false;
    eatenState=false;
    outBox=false;
    scatteredState=true;
    
    if (ghostName.equals("Inky")){
      currentTarget = new int[]{15,11};
    }
    else{
      if (ghostName.equals("Clyde")){
          currentTarget = new int[]{11,11};
      }
      else{
        currentTarget = new int[]{13,11};
      }
    }
    
    eatenTarget = new int[]{13,11};
    
    location = new PVector(xCoord,yCoord);
    xvelocity = new PVector(movementSpeed,0);
    yvelocity = new PVector(0,movementSpeed);
    
    ghostMap=map;
    
    currentUser=player;
  }
  
  public int[] getTarget(){
    return currentTarget;
  }
  
  public void showGhost(){
    image(ghost, location.x, location.y, size, size);
  }
  
  //get methods
  public String getName(){
    return ghostName;
  }

  public boolean outOfBox(){
    return outBox;
  }
  
  public void escapeBox(){
    int[] curr = getLocation();
    if (curr[0]==currentTarget[0]&&curr[1]==currentTarget[1]){
      outBox=true;
    }
  }
  
  public String getState(){
    if (scatteredState){
      return "scatter";
    }
    if (chaseState){
      return "chase";
    }
    if (scaredState){
      return "scared";
    }
    
    return "eaten";
    
  }
  public int[] getLocation(){
    int[] ghostLocation = new int[]{(int)(location.x/29),(int)(location.y/29)};
    return ghostLocation;
  }
  
  public void adjustSpeed(int newSpeed){
    movementSpeed = newSpeed;
  }
  
  public void adjustState(String state, int[] BlinkyLocation){
    removeCurrentState();
    if (state.equals("scared")){
      ghost = loadImage("Scared.png");
      scaredTarget();
      currentTarget=randomTarget;
      scaredState=true;
    }
    if (state.equals("scatter")){
      ghost = loadImage(ghostName+".png");
      currentTarget = scatterTarget();
      scatteredState=true;
    }
    
    if (state.equals("chase")){
      currentTarget = chaseTarget(currentUser, BlinkyLocation);
      chaseState=true;
    }
    
    if (state.equals("eaten")){
      ghost=loadImage("Eyes.png");
      currentTarget=eatenTarget;
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
      location.sub(yvelocity);
      ghostDirection = new PVector(0,-1);
    }
    
    if (direction.equals("down")){
      location.add(yvelocity);
      ghostDirection = new PVector(0,1);
    }
    
    showGhost();
  }
  
   public String chooseDirection(){
    int[] gridLocation = getLocation();
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
      
      if (possibleDirections.get(i).equals("left")){
        if (gridLocation[0]==1||ghostMap[gridLocation[1]][gridLocation[0]-1]==0){
          possibleDirections.remove(i);
          i--;
        }
        
      }
      else{
        if (possibleDirections.get(i).equals("right")){
          if (gridLocation[0]==26||ghostMap[gridLocation[1]][gridLocation[0]+1]==0){
            possibleDirections.remove(i);
            i--;
          }
        }
        else{
            if (possibleDirections.get(i).equals("up")){
          if (gridLocation[1]==1||ghostMap[gridLocation[1]-1][gridLocation[0]]==0){
            possibleDirections.remove(i);
            i--;
          }
        }else{
          if (possibleDirections.get(i).equals("down")){
          if (gridLocation[1]==29||ghostMap[gridLocation[1]+1][gridLocation[0]]==0){
            possibleDirections.remove(i);
            i--;
          }
        }
        }
        }
      }
      
    }
     int lowestDistance = findDistanceFromTarget(possibleDirections.get(0),gridLocation);
     String chosen = possibleDirections.get(0);
     for (int i=0;i<possibleDirections.size();i++){
       if (findDistanceFromTarget(possibleDirections.get(i), gridLocation)<lowestDistance){
         chosen = possibleDirections.get(i);
       }
     }
     
     
     return chosen;
    
  }
  
  public int findDistanceFromTarget(String direction, int[] currentLocation){
    if (direction.equals("left")){
      return (int)(Math.sqrt(Math.pow(currentLocation[0]-1-currentTarget[0],2)+Math.pow(currentLocation[1]-currentTarget[1],2)));
    }
    
    if (direction.equals("right")){
      return (int)(Math.sqrt(Math.pow(currentLocation[0]+1-currentTarget[0],2)+Math.pow(currentLocation[1]-currentTarget[1],2)));
    }
    
    if (direction.equals("up")){
      return (int)(Math.sqrt(Math.pow(currentLocation[0]-currentTarget[0],2)+Math.pow(currentLocation[1]-1-currentTarget[1],2)));
    }
     return (int)(Math.sqrt(Math.pow(currentLocation[0]-currentTarget[0],2)+Math.pow(currentLocation[1]+1-currentTarget[1],2)));
  }

  //targets for movement
    public void scaredTarget(){
      int[] scaredRandom = new int[]{(int)(Math.random()*28),(int)(Math.random()*31)};
      randomTarget=scaredRandom;
    }
    
    public int[] scatterTarget(){
    if (ghostName.equals("Pinky")){
      int[] target = new int[]{0,0};
      return target;
    }
    
    if (ghostName.equals("Blinky")){
      int[] target = new int[]{28,0};
      return target;
    }
    
    if (ghostName.equals("Inky")){
      int[] target = new int[]{28,31};
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
      int[] target = player.getCurrentTile();
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
    int distanceFromPacMan =(int) Math.sqrt(Math.pow((pacLocation[0]-ghostLocation[0]),2) + Math.pow((pacLocation[1]-ghostLocation[1]),2));
    if (distanceFromPacMan>=8){
      return pacLocation;
    }
    else{
      return scatterTarget();
    }   
  }
 
}
