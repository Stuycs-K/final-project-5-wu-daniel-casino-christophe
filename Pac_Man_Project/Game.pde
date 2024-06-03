public class Game{
  private int highScore;
  private int gameOver;
  private int levelWin;
  private int levelDifficulty;
  private String[] ghostStates;
  private Map grid;
  private PacMan player = new PacMan(grid.getTileMap());
  private Ghost Blinky;
  private Ghost Pinky;
  private Ghost Inky;
  private Ghost Clyde;
  private int currentState;
  
  public Game(){
    highScore = 0;
    grid = new Map();
    ghostStates = new String[]{"scatter", "chase"};
    currentState=0;
    Blinky = new Ghost("Blinky.jpg", grid.getTileMap(), player, 377,348);
    Pinky = new Ghost("Pinky.jpg",grid.getTileMap(), player, 377,435);
    Inky = new Ghost("Inky.jpg",grid.getTileMap(), player, 348,435);
    Clyde = new Ghost("Clyde.jpg",grid.getTileMap(), player, 406,435);
    
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
    Pinky.applyDirection(Blinky.chooseDirection());
    Inky.applyDirection(Blinky.chooseDirection());
    Clyde.applyDirection(Blinky.chooseDirection());
  }
  
  public void switchStates(){
    currentState++;
    if (currentState>=ghostStates.length){
      currentState=0;
    }
  }
}
