final int grid_length = 20;
final int grid_width = 10;

final int SQUARE_WIDTH = 50;
final int SQUARE_LENGTH =SQUARE_WIDTH;



GridSpace[][] grid;
int[] tetrominoPosition; //will have two values, x and y, of current_tetromino being controlled
GridSpace[][] current_tetromino;

int fr;


void setup() {
  
  //int w = SQUARE_WIDTH *10;
  //int h = SQUARE_WIDTH * 20;
  
  //size(w, h);
  
  size(500, 1000);
  background(255);
  
  fr=1;
  frameRate(fr);
  
  grid = new GridSpace[grid_length][grid_width];
  GridSpace temp = new GridSpace();

  grid = temp.createGrid();
  createTetrominoes(); //will initialise the z, l, t, i tetrominoes
  
  random = new Random(); //will choose random tetro, and random colour to go with it
  
  colours = new int[]{#FF0000, #00FF00, #0000FF, #FFFF00, #00FFFF, #FF00FF};
  //red, green, blue, yellow, cyan, purple
  
  tetrominoPosition = new int[2];
  
  rowsCleared=0;
  
  
  //current_tetromino; //will point to current tm, whichever one that may be
  
  //insert 1st tetromino at top-left hand corner
   insertTetromino();
}


void draw() {

  playTetris();
  tetrominoPosition[0]++;

  
}

void playTetris() {
  checkIfRowsAreFull();
  drawGrid();
  lowerTetromino();

}
