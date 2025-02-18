
//---------------------------------------------------------------------------------------------------------------------------- // Member functions of Map

int getIndex(int i, int j) {                                 //provided a unique i and j value
  int it = 0;

  for (int ip = 0; ip < size; ip++) {
    for (int jp = 0; jp < size; jp++) {
      if (grid[it].getI() == i && grid[it].getJ() == j) {
        return it;                                           //return the position of the tile with that i and j value
      }
      it++;
    }
  }

  return -1;                                                 // unless no such tile exists.
}

//-------------------------------------------------------------------------------------------------------------------------

boolean win() {
  for (int i = 0; i < size*size; i++) {
    if (grid[i].hidden && !grid[i].trapped && !gameOver) {
      return false;
    }
  }
  return true;
}

//-------------------------------------------------------------------------------------------------------------------------

void show() {
  for (int iterator = 0; iterator < size*size; iterator++) {
    grid[iterator].show();         //initalise every tile in the grid
  }
}//close show

//-------------------------------------------------------------------------------------------------------------------------

void end() {
  for (int i = 0; i < size*size; i++) {
    grid[i].flagged = false;
    grid[i].reveal();
  }
  ended = true;
}

//-------------------------------------------------------------------------------------------------------------------------

void flag() {

  int index = 0;
  while (!grid[index].mouseOver()) {  //find tile that was clicked
    index++;
  }

  grid[index].flag(); //toggle flag
}

//-------------------------------------------------------------------------------------------------------------------------
