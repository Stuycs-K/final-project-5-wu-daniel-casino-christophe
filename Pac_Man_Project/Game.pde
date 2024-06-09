import java.util.ArrayList;
import java.util.Arrays;
public class Game {
  private int highScore;
  private int gameOver;
  private int levelWin;
  private int levelDifficulty;
  private int currentState;
  private String[] ghostStates;
  private PImage PacManMapImage;
  private Map currentMap;
  private KeyboardBuffer keyboardInput;
  private PacMan player;
  private Ghost Blinky;
  private Ghost Pinky;
  private Ghost Inky;
  private Ghost Clyde;

  public Game() {
    highScore = 0;
    currentState = 0;
    currentMap = new Map();
    PacManMapImage = loadImage("PacManMapVeryFinal.jpg");
    player = new PacMan(currentMap.tileMap, 3);
    ghostStates = new String[] {
      "scatter",
      "chase"
    };
    Blinky = new Ghost("Blinky.jpg", currentMap.tileMap, player, 377, 348);
    Pinky = new Ghost("Pinky.jpg", currentMap.tileMap, player, 377, 435);
    Inky = new Ghost("Inky.jpg", currentMap.tileMap, player, 350, 406);
    Clyde = new Ghost("Clyde.jpg", currentMap.tileMap, player, 449, 420);
    keyboardInput = new KeyboardBuffer();
    player.applyDirection("left");
    player.updateLocation();
  }

  public void run() {
    image(PacManMapImage, 0, 0);
    for (int i = 0; i < currentMap.getRowTiles(); i++) {
      for (int j = 0; j < currentMap.getColumnTiles(); j++) {
        if (currentMap.tileMap[j][i] == 2) {
          fill(255, 255, 0);
          circle(i * 29 + 14, j * 29 + 14, 10);
        }
        if (currentMap.tileMap[j][i] == 3) {
          fill(255, 255, 0);
          circle(i * 29 + 14, j * 29 + 14, 20);
        }
      }
    }
    println(Arrays.toString(Clyde.getLocation()));
    println(Clyde.outOfBox());
    Blinky.adjustState(ghostStates[currentState], Blinky.getLocation());
    if (Pinky.outOfBox()) {
      Pinky.adjustState(ghostStates[currentState], Blinky.getLocation());
    } else {
      Pinky.gotOut();
    }
    if (Inky.outOfBox()) {
      Inky.adjustState(ghostStates[currentState], Blinky.getLocation());
    } else {
      Inky.gotOut();
    }
    if (Clyde.outOfBox()) {
      Clyde.adjustState(ghostStates[currentState], Blinky.getLocation());
    }
    if (Pinky.outOfBox() && Clyde.outOfBox() && Inky.outOfBox()) {
      currentMap.blockPink();
    }
    

    Blinky.applyDirection(Blinky.chooseDirection());
    Pinky.applyDirection(Pinky.chooseDirection());
    Inky.applyDirection(Inky.chooseDirection());
    Clyde.applyDirection(Clyde.chooseDirection());
    Blinky.showGhost();
    Pinky.showGhost();
    Inky.showGhost();
    Clyde.showGhost();

    fill(255);
    textSize(40);
    text("Score", 32, 323);
    text("" + player.getScore(), 38, 349);

    player.showPacMan();
    player.updateLocation();
    player.getCurrentTile();
    if (ghostCollision()) {
      player.subtractLife();
      player.moveToStart();
    }
    pelletCollision();
  }

  public void switchStates() {
    currentState++;
    if (currentState >= ghostStates.length) {
      currentState = 0;
    }
  }

  public void keyboardSetter(int code, boolean pressed) {
    keyboardInput.press(code, pressed);
    updateKeyboard();
  }

  public Ghost getBlinky() {
    return Blinky;
  }
  public Ghost getInky() {
    return Inky;
  }
  public Ghost getPinky() {
    return Pinky;
  }
  public Ghost getClyde() {
    return Clyde;
  }

  public PacMan getPlayer() {
    return player;
  }

  public void updateKeyboard() {
    if (keyboardInput.P1_UP) {
      player.applyDirection("up");
    }
    //check if the button P1_RIGHT is being pressed:
    if (keyboardInput.P1_DOWN) {
      player.applyDirection("down");
    }
    //check if the button P1_LEFT is being pressed:
    if (keyboardInput.P1_LEFT) {
      player.applyDirection("left");
    }
    //check if the button P1_RIGHT is being pressed:
    if (keyboardInput.P1_RIGHT) {
      player.applyDirection("right");
    }
  }

  public Boolean ghostCollision() {
    ArrayList < Ghost > ghostList = new ArrayList < Ghost > ();
    ghostList.add(Blinky);
    ghostList.add(Inky);
    ghostList.add(Pinky);
    ghostList.add(Clyde);
    for (Ghost g: ghostList) {
      if ((g.getLocation()[0] == player.getCurrentTile()[0]) && (g.getLocation()[1] == player.getCurrentTile()[1])) {
        return true;
      }
    }
    return false;
  }

  public void pelletCollision() {
    int tileType = currentMap.tileMap[player.getCurrentTile()[1]][player.getCurrentTile()[0]];
    if ((tileType == 2) || (tileType == 3)) {
      player.pellet(tileType);
      currentMap.tileMap[player.getCurrentTile()[1]][player.getCurrentTile()[0]] = 1;
    }
  }
}
