//grid = 2d array of 'space' objects in grid

class GridSpace {
  
  public int occupied;  //if ==1, full. if ==0, empty
  public int colour;
  
  // I have three almost identical constructors bc I did not appreciate the value of coding standards before this lol
  public GridSpace() {//int occupied, int colour) {
    this.occupied = 0;
    this.colour = #000000;
  }
  
  public GridSpace(int  occupied, int colour) {
    this.occupied = occupied;
    this.colour = colour;
  }
  
  //this is use in create_tetrominoes for code documentation, you'll see if you go to where I create the shapes
  public GridSpace( String type) {
    if (type.equals("full")) {
      this.occupied = 1;
      this.colour = #000000;
    }
    else {
      this.occupied = 0;
      this.colour = #000000;
    }
      
  }
  
  public GridSpace[][] createGrid() {
    GridSpace[][] temp_grid = new GridSpace[20][10];
    
    for (int i=0; i<20; i++) {
      for (int j =0; j<10; j++) {
        
        GridSpace t = new GridSpace();
        temp_grid[i][j] = t;
        
      }
    }
    
    return temp_grid;
  }
  
  
}
