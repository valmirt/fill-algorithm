/** Universidade Federal de Góias
  * Computação Gráfica 
  *
  * Valmir Torres de Jesus Junior
  * Atividade individual 3
  * 06/09/2018
**/

int SCREEN_WIDTH = 1024;
int SCREEN_HEIGHT = 768;

Polygon polygon;

void setup() {
  size(1024, 768);
  background(0);
  createRandomPolygon();
  polygon.drawPolygon();
}

void draw() {
}

void keyPressed(){
    if (keyCode == 27){
        exit();
    }
}

void createRandomPolygon(){
  int n = randomGen(3, 10);
  int[][] points = new int[n][2];
  for(int i = 0; i < n; i++){
    points[i][0] = randomGen(1, SCREEN_WIDTH);
    points[i][1] = randomGen(1, SCREEN_HEIGHT);
  }
  int[][] lines = new int[n][4];
  for(int i = 0; i < n; i++){
    //recuperando xi e yi
    lines[i][0] = points[i][0];
    lines[i][1] = points[i][1];
    //recuperando xf e yf
    if (i == n-1){
      lines[i][2] = points[0][0];
      lines[i][3] = points[0][1];
    } else {
      lines[i][2] = points[i+1][0];
      lines[i][3] = points[i+1][1];
    }
  }
  
  int[] colorBorder = {
    randomGen(1, 256), 
    randomGen(1, 256), 
    randomGen(1,256)
  };
  int[] colorInside = {
    randomGen(1, 256), 
    randomGen(1, 256), 
    randomGen(1,256)
  };
  
  polygon = new Polygon(points, lines, colorBorder, colorInside, false);
}

int randomGen(int first, int last) {
  int temp = (int) random(first, last);
  return temp;
}
