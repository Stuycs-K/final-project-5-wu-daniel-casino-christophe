public class Map extends Game{
  int rowPixels;
  int columnPixels;
  int rowTiles;
  int columnTiles;
  
  public Map(){
    rowPixels = 812;
    columnPixels = 1015;
    rowTiles=28;
    columnTiles=36;
  }
  
  public int getRP(){
    return rowPixels;
  }
  
  public int getCP(){
    return columnPixels;
  }
}
