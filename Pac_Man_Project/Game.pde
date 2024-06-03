public class Game{
  private int highScore;
  private int gameOver;
  private int levelWin;
  private int levelDifficulty;
  private Map grid;
  
  public Game(){
    highScore = 0;
    PacMan player = new PacMan();
    Ghost Blinky = new Ghost("Blinky.jpg", grid.getMap, player, 377,348);
    Ghost Pinky = new Ghost("Pinky.jpg",grid.getMap, player, 377,435);
    Ghost Inky = new Ghost("Inky.jpg",grid.getMap, player, 348,435);
    Ghost Clyde = new Ghost("Clyde.jpg",grid.getMap, player, 406,435);
    
    Blinky.adjustState("scatter", Blinky.getLocation());
    Pinky.adjustState("scatter", Blinky.getLocation());
    Inky.adjustState("scatter", Blinky.getLocation());
    Clyde.adjustState("scatter", Blinky.getLocation());
    
    Blinky.applyDirection(Blinky.chooseDirection);
    Pinky.applyDirection(Blinky.chooseDirection);
    Inky.applyDirection(Blinky.chooseDirection);
    Clyde.applyDirection(Blinky.chooseDirection);
  }
}
