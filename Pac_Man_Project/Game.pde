public class Game{
  private int highScore;
  private int gameOver;
  private int levelWin;
  private int levelDifficulty;
  private String[] ghostStates;
  private PacMan player;
  private Ghost Blinky;
  private Ghost Pinky;
  private Ghost Inky;
  private Ghost Clyde;
  private int currentState;
  
  public Game(int[][] map){
    highScore = 0;
    player = new PacMan(map);
    ghostStates = new String[]{"scatter", "chase"};
    currentState=0;
    Blinky = new Ghost("Blinky.jpg", map, player, 377,348);
    Pinky = new Ghost("Pinky.jpg",map, player, 377,435);
    Inky = new Ghost("Inky.jpg",map, player, 348,435);
    Clyde = new Ghost("Clyde.jpg",map,player, 406,435);
    
  }
  
  public void run(){
    if (ghostStates[currentState].equals("scatter")){
      Blinky.adjustState(ghostStates[currentState], Blinky.getLocation());
      Pinky.adjustState(ghostStates[currentState], Blinky.getLocation());
      Inky.adjustState(ghostStates[currentState], Blinky.getLocation());
      Clyde.adjustState(ghostStates[currentState], Blinky.getLocation());
      
    }
    
    if (ghostStates[currentState].equals("chase")){
      Blinky.adjustState(ghostStates[currentState], Blinky.getLocation());
      Pinky.adjustState(ghostStates[currentState], Blinky.getLocation());
      Inky.adjustState(ghostStates[currentState], Blinky.getLocation());
      Clyde.adjustState(ghostStates[currentState], Blinky.getLocation());
    }
    
    
   Blinky.applyDirection(Blinky.chooseDirection());
    Pinky.applyDirection(Pinky.chooseDirection());
    Inky.applyDirection(Inky.chooseDirection());
    Clyde.applyDirection(Clyde.chooseDirection());
      Blinky.showGhost();
      Pinky.showGhost();
      Inky.showGhost();
      Clyde.showGhost();
  }
  
  public void switchStates(){
    currentState++;
    if (currentState>=ghostStates.length){
      currentState=0;
    }
  }
}
