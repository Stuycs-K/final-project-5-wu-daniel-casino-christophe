public class Game{
  private int highScore;
  private int gameOver;
  private int levelWin;
  private int levelDifficulty;
  private int[] ghostStates;
  private Map grid;
  private PacMan player = new PacMan();
  private Ghost Blinky;
  private Ghost Pinky;
  private Ghost Inky;
  private Ghost Clyde;
  private int currentState;
  
  public Game(){
    highScore = 0;
    grid = new Map();
    ghostStates = new int[]{"scatter", "chase"};
    currentState=0;
    Blinky = new Ghost("Blinky.jpg", grid.getMap, player, 377,348);
    Pinky = new Ghost("Pinky.jpg",grid.getMap, player, 377,435);
    Inky = new Ghost("Inky.jpg",grid.getMap, player, 348,435);
    Clyde = new Ghost("Clyde.jpg",grid.getMap, player, 406,435);
    
  }
  
  public void run(){
    if (currentState.equals("scatter")){
      Blinky.adjustState("scatter", Blinky.getLocation());
      Pinky.adjustState("scatter", Blinky.getLocation());
      Inky.adjustState("scatter", Blinky.getLocation());
      Clyde.adjustState("scatter", Blinky.getLocation());
    }
    
    if (currentState.equals("chase")){
      Blinky.adjustState("chase", Blinky.getLocation());
      Pinky.adjustState("chase", Blinky.getLocation());
      Inky.adjustState("chase", Blinky.getLocation());
      Clyde.adjustState("chase", Blinky.getLocation());
    }
    
    
    Blinky.applyDirection(Blinky.chooseDirection);
    Pinky.applyDirection(Blinky.chooseDirection);
    Inky.applyDirection(Blinky.chooseDirection);
    Clyde.applyDirection(Blinky.chooseDirection);
  }
  
  public void switchStates(){
    currentState++;
    if (currentState>=ghostStates.length){
      currentState=0;
    }
  }
}
