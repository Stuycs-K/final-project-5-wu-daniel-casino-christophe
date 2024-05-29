public class PacMan{
  int movementSpeed;
  int size;
  int score;
  Boolean alive;
  Boolean addedLife;
  int lifeCount;
  Boolean activeState;
  int x;
  int y;
  int ghostsConsumed;
  
  public PacMan(){
    movementSpeed = 8;
    lifeCount = 3;
    score = 0;
    size = 35;
    addedLife = false;
    x = 490;
    y = 1260 - 367;
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
}
