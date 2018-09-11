/** Universidade Federal de Góias
  * Computação Gráfica 
  *
  * Valmir Torres de Jesus Junior
  * Atividade individual 3
  * 11/09/2018
**/

class Polygon {
  private int[][] points;
  private int[][] lines;
  private int[] colorBorder;
  private int[] colorInside;
  private boolean fill;
  private TableP[] sides;
  
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
  
  int[][] getLines(){
    return this.lines;
  }
  
  int[] getColorBorder(){
    return this.colorBorder;
  }
  
  int[] getColorInside(){
    return this.colorInside;
  }
  
  boolean isFill(){
    return this.fill;
  }
  
  void drawPolygon(){
     int p = points.length;
     
     for(int i = 0; i < p; i++) {
       linhaDDA(lines[i][0], 
                lines[i][1], 
                lines[i][2], 
                lines[i][3], 
                colorBorder[0], 
                colorBorder[1], 
                colorBorder[2]);
     }
     
     if (this.fill) customFill();
  }
  
  private void customFill(){
    calculateTable();
    int p = points.length;
    FloatList aux = new FloatList();
    
    for(int yVarredura = 0; yVarredura < SCREEN_WIDTH; yVarredura++) {
      for(int i = 0; i < p; i++) {
        if((yVarredura <= sides[i].yMax) && (yVarredura >= sides[i].yMin)){
          if(sides[i].yMin != sides[i].yMax){
            float temp = sides[i].coef * (yVarredura - sides[i].yMin) + sides[i].xTy;
            aux.append(temp);  //<>//
          }
        }
      }
      
      if(aux.size() > 0 && aux.size() % 2 != 0) {
        aux.sort();
        
        for(int i = 0; i < aux.size(); i++) {
          for(int j = i + 1; j < aux.size(); j++){
            if(round(aux.get(i)) == round(aux.get(j))){
              aux.remove(i);
              break;
            }
          }
        }
      }
      
      if (aux.size() > 0 && aux.size() % 2 == 0){
        aux.sort();
        
        for (int i = 0; i < aux.size(); i = i + 2)
          linhaDDA((int) aux.get(i)+1, 
                   yVarredura, 
                   (int) aux.get(i+1)-1,
                   yVarredura, 
                   colorInside[0],
                   colorInside[1],
                   colorInside[2]);
                  
      }
      aux.clear();
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
  
  private void calculateTable() {
    int p = points.length;
    sides = new TableP[p];
    int yMin, yMax, xTy;
    float coef;
    
    for (int i = 0; i < p; i++){
      if (lines[i][1] <= lines[i][3]) {
        yMin = lines[i][1]; 
        yMax = lines[i][3];
        xTy = lines[i][0];
      } else {
        yMin = lines[i][3]; 
        yMax = lines[i][1];
        xTy = lines[i][2];
      }
      if ((float)lines[i][1] - lines[i][3] == 0) coef = 0;
      else coef = ((float)(lines[i][0]-lines[i][2])/(float)(lines[i][1]-lines[i][3]));     
      sides[i] = new TableP(i+1, yMin, yMax, xTy, coef);
    }
  }
}
