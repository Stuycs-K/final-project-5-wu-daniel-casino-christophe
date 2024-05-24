public class PacMan{
  int movementSpeed;
  int size;
  int score;
  Boolean alive;
  int lifeCount;
  Boolean activeState;
  int[] location;
  int ghostsConsumed;
  
  public PacMan(int speed, int lives, int score, int size){
    movementSpeed = speed;
    lifeCount = lives;
    this.score = score;
    this.size = size;
  }
  
  public int getLives(){
    return lifeCount;
  }
  
  public int getScore(){
    return score;
  }
  
  public int[] getCoords(){
    return location;
  }
  
  public int getConsumedGhosts(){
    return ghostsConsumed;
  }
}
