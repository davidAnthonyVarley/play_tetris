//tetris
int rowsCleared;

public void removerow( int rowNum) { //row num = number of row to be removed
  
    
    //shift all rows down
    for (int i = rowNum; i>0; i--) {
      for (int j =0; j<10; j++) {
        
      //make grid space equal to grid space above it
      grid[i][j] = grid[i-1][j];
      }
    }
    
    //create empty top row
    
    for (int j =0; j<10; j++) {
      grid[0][j] = new GridSpace("empty");
    }
  
  
}

public boolean isRowFull( int rowNum) {
  
  for (int j =0; j<10; j++) {
    if (grid[rowNum][j].occupied!=2)
      return false;
    }
    
  return true;
  
}

void checkIfRowsAreFull() {
  for (int i=grid_length-1; i> -1; i--) {
      
    if (isRowFull(i)) {
      removerow(i);
      rowsCleared+=1;
      println(rowsCleared, "rows cleared!");
    }
    }
  
  
}

void endGame() {
  println("Game Over!");
  println("You cleared:\n", rowsCleared, " levels!");
  noLoop();
  
}
  
  
  
  
  
  
  
  
  
  
  
