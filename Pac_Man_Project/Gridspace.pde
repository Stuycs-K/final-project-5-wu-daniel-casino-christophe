public class Gridspace {
  private int x;
  private int y;
  private int[][] tileMap;
  
  public Gridspace(int row, int col){
    x = row*29;
    y=col*29;
  }
  
  public int[] getMiddlePixel(){
    int[] ans = new int[2];
    ans[0] = x + 14;
    ans[1] = y + 14;
    return ans;
  }
}
