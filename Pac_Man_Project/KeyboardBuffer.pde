/**************KeyboardBuffer TAB************/
public class KeyboardBuffer {
  //make a list of actions you want to have in your program
  //As a simple example this is just two instance varibles, but a list/array would work well for large quantities.
  boolean P1_UP;
  boolean P1_DOWN;
  boolean P1_LEFT;
  boolean P1_RIGHT;

  public KeyboardBuffer() {
    P1_UP = false;
    P1_DOWN = false;
    P1_LEFT = false;
    P1_RIGHT = false;
  }

  //Map your keys here. You can bind any key presses to
  //different "actions" e.g. P1_LEFT suggests player1 goes left when this is held down.
  void press(int code, boolean pressed) {
    //println("Pressed: "+code);//Help you figure out codes that aren't working the way you want.
    if(code == 'W' || code == UP){
      P1_UP = pressed;
      P1_DOWN = false;
      P1_LEFT = false;
      P1_RIGHT = false;
    }
    if(code == 'S' || code == DOWN){
      P1_DOWN = pressed;
      P1_UP = false;
      P1_LEFT = false;
      P1_RIGHT = false;
    }
    if(code == 'A' || code == LEFT){
      P1_LEFT = pressed;
      P1_UP = false;
      P1_DOWN = false;
      P1_RIGHT = false;
    }
    if(code == 'D' || code == RIGHT){
      P1_RIGHT = pressed;
      P1_UP = false;
      P1_DOWN = false;
      P1_LEFT= false;
    }
  }
  
  public String getLastDirection(){
    if(P1_UP == true){
      return "up";
    }
    if(P1_DOWN == true){
      return "down";
    }
    if(P1_LEFT == true){
      return "left";
    }
    return "right";
  }

}
