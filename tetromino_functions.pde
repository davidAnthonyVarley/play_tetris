

public void colourTetromino(GridSpace[][] tetro, int colour) {
  
  for (int i=0; i<tetro.length; i++) {
      for (int j =0; j<tetro[0].length; j++) {
        
        if (tetro[i][j].occupied==1) {
          tetro[i][j].colour=colour;
        }
        
      }
    }
}



public void placeTetromino() {
  
  tetrominoPosition[0]--;
  
  int row = tetrominoPosition[0];
  int column = tetrominoPosition[1];
  
  
  for (int i=row; i<row + current_tetromino.length; i++) {
      for (int j = column; j<column+ current_tetromino[0].length; j++) {
        
        //if the selected square in the tetromino is full, and the corresponding square in the grid is empty, place the square in the grid permanently
        if (current_tetromino[i-row][j-column].occupied==1 && grid[i][j].occupied==0) {
          
          //==2 means that the square is permanent, and the function that removes the tetromino impression will not empty this grid space
          grid[i][j].occupied=2;
          grid[i][j].colour = current_tetromino[i-row][j-column].colour;
        }
        
        
        //println(current_tetromino.occupied);
        //println(grid[i][j].occupied);
        
        
      }
    }
  
  //set current position back to top-left corner
  tetrominoPosition[0] = 0;
  tetrominoPosition[1] = 0;
  insertTetromino();
}

void mousePressed() {
  noLoop();

}

void mouseReleased() {
  loop();
}


public void lowerTetromino() {
  
  removeExistingTetrominoImpression();
  
  //if the tet fits, continue to lower
  if (tetrominoFits() ) {
    
  
  
  
  int row = tetrominoPosition[0];
  int col = tetrominoPosition[1];
  
  //place tet one space lower, as tetPosition has already been altered in removeExistingTetrominoImpression()
  try {
  
    for (int i = 0; i < current_tetromino.length; i++, row++) {
      for (int j = 0; j < current_tetromino[0].length; j++, col++) {
        
          grid[row][col] = new GridSpace(current_tetromino[i][j].occupied, current_tetromino[i][j].colour);
          //println(row, col);
          //println(i, j, "\n");

      }
      
      col = tetrominoPosition[1];
    }
  
    
  }
  
  catch (ArrayIndexOutOfBoundsException e) {
    tetrominoPosition[0] = 0;
    tetrominoPosition[1] = 0;
  }
  
  }
  //else if the tet no longer fits, revert to last position, and print tetromino onto the grid permanently
  else {
    placeTetromino();

  }
  
}

//insert tetro at the top
public void insertTetromino() {
  
  int next_shape = random.nextInt(tetrominoes.length);
  current_tetromino = tetrominoes[next_shape]; //find number between 0 and length of tetromino array

  
  current_colour = colours[random.nextInt(colours.length)];
  
  
  //I dont need to create a new copy of each tetromino each time, as I will print their characteristics onto the grid, and then remove the tetromino
  
  colourTetromino( current_tetromino, current_colour);
  
  tetrominoPosition[0] = 0;
  tetrominoPosition[1] = 0;
  
  
  
}


void testdraw() {
  //test placing a tetrad in grid
  current_tetromino = Z;
  colourTetromino( current_tetromino, #0000FF);
  
  int row = tetrominoPosition[0];
  int col = tetrominoPosition[1];
  
  for (int i= 0 ; i< (current_tetromino.length); i++, row++) {
      for (int j = 0; j< (current_tetromino[0].length); j++, col++) {
        
          grid[row][col] = current_tetromino[i][j];
          println(row, col);
          println(i, j, "\n");

      }
      
      col=tetrominoPosition[1];
    }
  
  tetrominoPosition[0]++;
}





public void removeExistingTetrominoImpression() {
  int row = tetrominoPosition[0];
  int col = tetrominoPosition[1];
  
  //remove existing tetromino impression
  
  row--;
  
  if (col>0)
    col--;
  
  int longerThanTetromino = current_tetromino.length+1;
  //if ( (longerThanTetromino+row)>grid_length )
  //  longerThanTetromino--;

  int widerThanTetromino = current_tetromino[0].length+1;
  
  
  //this code is a lot more efficient, will adjust it later to work properly
  for (int i= row ; i< (longerThanTetromino+row); i++) {
      for (int j = col; j< (widerThanTetromino+col); j++) {
        
        //if the current space selected in the tetromino is empty, but in the grid it is full (ie, from a previous tetromino being placed),
        //don't empty that space

        try {
          if (grid[i][j].occupied!=2) {
            grid[i][j] = new GridSpace();//"empty");
          }
          
        }
          
        catch (ArrayIndexOutOfBoundsException e) {
        }
        
      }
    }
  

}


public boolean tetrominoFits() {
  
  //check if current_tetromino will print cleanly onto grid
  
  int row = tetrominoPosition[0];
  int col = tetrominoPosition[1];
  
  if ( (row+current_tetromino.length) > grid_length) {
    return false;
  }
   else if (tetrominoPosition[0]<0) {
    tetrominoPosition[0]=0;
    return true;
  }
  
    
  for (int i = 0; i < current_tetromino.length; i++) {
      for (int j = 0; j < current_tetromino[0].length; j++) {
        
        //if the current tetromino overlaps with an existing square, return false, as the tetromino will not fit
        
        //if the current tetromin
          try {
          if ( grid[row+i][col+j].occupied==2 ) {
  
              if (current_tetromino[i][j].occupied==0) {
                tetrominoPosition[0]++;
              }
              
              if (i==0)
                endGame();

              
              return false;
            //}
          }
          }
          
          catch (ArrayIndexOutOfBoundsException e) {
            //if on outside right of grid
            if ((tetrominoPosition[1]+current_tetromino.length) > grid_width ) {
              tetrominoPosition[1] = grid_width - current_tetromino.length ;
              return true;
            }
            //if on outside left of grid
            else if ((tetrominoPosition[1]) < 0 ) {
              tetrominoPosition[1]=0;
              return true;
            }
          }
      }
      
      col = tetrominoPosition[1];
    }
  
  
  return true;
  
  
}





void drawGrid() {
  int row =0;
  int col=0;
  
  
  for (int i=0; i< grid_length; i++, row+=SQUARE_LENGTH) { //<>//
      for (int j =0; j<grid_width; j++, col+=SQUARE_WIDTH) {
        
        fill(grid[i][j].colour);
        stroke(255);
        rect(col, row, SQUARE_WIDTH, SQUARE_LENGTH);
        
      }
      //move back to left-hand side after drawing from left to right
      col=0;
    }
  
}
