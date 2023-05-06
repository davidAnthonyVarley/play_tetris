import java.util.Random; //get random colours

//specific tetrominoes to fall

//it is neater to place them in this file
GridSpace[][] L;
GridSpace[][] Z;
GridSpace[][] I;
GridSpace[][] T;
GridSpace[][] Square;

Random random;
GridSpace[][][] tetrominoes; //will contain the tetrominoes above
int[] colours;
int current_colour;

boolean moveLeft;
boolean moveRight;

public void createTetrominoes() {
  //L = new GridSpace[3][2];
  //Z = new GridSpace[3][2];
  //I = new GridSpace[4][1];
  //T = new GridSpace[2][3];
  
  //Square = new GridSpace[2][2];

  //declare shapes
  
  L = new GridSpace[][] { 
        { new GridSpace("full"), new GridSpace("empty") },
        { new GridSpace("full"), new GridSpace("empty") },
        { new GridSpace("full"), new GridSpace("full")  } 
      };
                        
  Z = new GridSpace[][] { 
        { new GridSpace("empty"), new GridSpace("full") },
        { new GridSpace("full"), new GridSpace("full")  },
        { new GridSpace("full"), new GridSpace("empty") } 
      };
      
  I = new GridSpace[][] {
        { new GridSpace("full") },
        { new GridSpace("full") },
        { new GridSpace("full") },
        { new GridSpace("full") }
  };
  
  T = new GridSpace[][] { 
        { new GridSpace("empty"), new GridSpace("full"), new GridSpace("empty") },
        { new GridSpace("full"), new GridSpace("full"),  new GridSpace("full")  },
      };
      
  Square = new GridSpace[][] { 
        { new GridSpace("full"), new GridSpace("full") },
        { new GridSpace("full"), new GridSpace("full") },
      };
  
  tetrominoes = new GridSpace[][][]{ L, Z, T, I, Square};
}






void keyPressed() {

  //check if out of bounds 
  if (keyCode==RIGHT &&  (tetrominoPosition[1]+current_tetromino.length) < grid_width ) {
    
    removeExistingTetrominoImpression();
    
    moveRight=true;
    moveLeft=false;
    
  }
  else if (keyCode==LEFT && ( (tetrominoPosition[1]-1) > -1) ) {
   removeExistingTetrominoImpression();
    
   moveLeft=true;
   moveRight=false;
   
  }
  else if (key=='r') {
    removeExistingTetrominoImpression();
    tetrominoPosition[1]= grid_width - current_tetromino[0].length;
  }
  else if (key=='l') {
    removeExistingTetrominoImpression();
    tetrominoPosition[1]= 0;
  }
  else if (key==' ') {
    removeExistingTetrominoImpression();
    tetrominoPosition[0]-=2;
    tetrominoPosition[1]+=3;
  }
  else if (key=='s') {
    if (fr>1) {
      fr--;
      frameRate(fr);
    }
  }
  else if (key=='f') {
    fr++;
    frameRate(fr);
  }
}




void keyReleased() {
  
  
   //println("released");
  
  if (moveRight) {
    tetrominoPosition[1]++;
    tetrominoPosition[0]-=2;
    
    moveRight=false;
    
    //playTetris();
  
  }
  else if (moveLeft) {
   tetrominoPosition[0]-=2;
   tetrominoPosition[1]--;

   
   moveLeft=false;
   //playTetris();
   
   
  }
  
  
}
