/** Universidade Federal de Góias
  * Computação Gráfica 
  *
  * Valmir Torres de Jesus Junior
  * Atividade individual 3
  * 06/09/2018
**/

class Polygon {
  private int[][] points;
  private int[][] lines;
  private int[] colorBorder;
  private int[] colorInside;
  private boolean fill;
  
  Polygon(){}
  
  Polygon(int[][] points, int[][] lines, int[] colorBorder, int[]colorInside, boolean fill){
    this.points = points;
    this.lines = lines;
    this.colorBorder = colorBorder;
    this.colorInside = colorInside;
    this.fill = fill;
  }
  
  int[][] getPoints(){
    return this.points;
  }
  
  void setPoints(int[][] points){
    this.points = points;
  }
  
  int[][] getLines(){
    return this.lines;
  }
  
  void setLines(int[][] lines){
    this.lines = lines;
  }
  
  int[] getColorBorder(){
    return this.colorBorder;
  }
  
  void setColorBorder(int[] colorBorder){
    this.colorBorder = colorBorder;
  }
  
  int[] getColorInside(){
    return this.colorInside;
  }
  
  void setColorInside(int[] colorInside){
    this.colorInside = colorInside;
  }
  
  boolean isFill(){
    return this.fill;
  }
  
  void drawPolygon(){
     int p = points.length;
     
     for(int i = 0; i < p; i++) {
       linhaDDA(lines[i][0], lines[i][1], lines[i][2], lines[i][3], colorBorder[0], colorBorder[1], colorBorder[2]);
     }
  }
  
  private void linhaDDA(int xi, int yi, int xf, int yf, int r, int g, int b) {
    int dx = xf - xi, dy = yf - yi, steps, k;
    float incX, incY, x = xi, y = yi;
    
    if (abs(dx) > abs(dy)) steps = abs(dx);
    else steps = abs(dy);
    
    incX = dx / (float) steps;
    incY = dy / (float) steps;
    
    stroke(r, g, b);
    point((int) x, (int) y);
    for (k = 0; k < steps; k++){
      x += incX;
      y += incY;
      
      point((int) x, (int) y);
    }
  }
}
