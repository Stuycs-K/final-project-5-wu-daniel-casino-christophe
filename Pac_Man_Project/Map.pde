public class Map extends Game{
  private int rowPixels;
  private int columnPixels;
  private int rowTiles;
  private int columnTiles;
  
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
