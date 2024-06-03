public class Gridspace {
  private int x;
  private int y;
  private int[][] tileMap;
  
  public Gridspace(){
  }
  
  public int[] getMiddlePixel(int row, int col){
    int[] ans = new int[2];
    ans[0] = (29 * col) + 14;
    ans[1] = (29 * row) + 14;
    return ans;
  }
}
