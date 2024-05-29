int rowTiles;
int columnTiles;

void setup(){
  size(980, 1260);
  rowTiles=28;
  columnTiles=36;
}

void draw(){
  Ghost Blinky = new Ghost("Blinky.jpg");
  Blinky.showGhost(0, 0);

}
