/** Universidade Federal de Góias
  * Computação Gráfica 
  *
  * Valmir Torres de Jesus Junior
  * Atividade individual 3
  * 06/09/2018
**/

int SCREEN_WIDTH = 800;
int SCREEN_HEIGHT = 600;

Polygon polygon;

void setup() {
  size(800, 600);
  background(0);
  showMenu();
}

void draw() {
}

void keyPressed(){
    if (keyCode == 27){
        exit();
    }
    
    if (key == '1'){
      background(0);
      showMenu();
      createRandomPolygon(false);
      polygon.drawPolygon();
    }
    if(key == '2'){
      background(0);
      showMenu();
      //createRandomPolygon(true);
      //polygon.drawPolygon();
      textSize(16);
      text("Sorry, I have not implemented this yet.", 10, 120);
    }
}

void showMenu(){
  textSize(16);
  text("Options menu:", 10, 30);
  text("1- Draw a random polygon without filling it.", 10, 60);
  text("2- Draw a random polygon by filling it.", 10, 90);
}

void createRandomPolygon(boolean fill){
  int n = randomGen(3, 10);
  int[][] points = new int[n][2];
  for(int i = 0; i < n; i++){
    points[i][0] = randomGen(1, SCREEN_WIDTH);
    points[i][1] = randomGen(120, SCREEN_HEIGHT);
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
  
  polygon = new Polygon(points, lines, colorBorder, colorInside, fill);
}

int randomGen(int first, int last) {
  int temp = (int) random(first, last);
  return temp;
}
