
void reveal() {
  int i, j;
  int index = 0;
  while (!grid[index].mouseOver()) {              //increase index till weve found the right tile
    index++;
  }

  gameOver = grid[index].reveal();                //if tile is bomb gameover return and turn != 1
  if (gameOver && turn1) {
    setup();
    //reveal();
  }
  
  if (!gameOver && grid[index].value != 0) {      // if not bomb and value !=0 return
    return;
  }

  int zeros[] = new int [size * size];
  int iterator = 0;
  //if value == 0, reveal the sorrounding 8 tiles
  i = grid[index].getI();
  j = grid[index].getJ();

  for (int iPos = i - 1; iPos <= i + 1; iPos++) {
    for (int jPos = j - 1; jPos <= j + 1; jPos++) { //------ iterate through the 8 tiles around the bomb
      int dex = getIndex(iPos, jPos); //-------------------- store position of tile under inspection
      if (dex != -1 && grid[dex].hidden) {//---------------------- if the position exists and is hidden
        grid[dex].reveal(); //-------------------------------- reveal tile
        if (grid[dex].value == 0) {
          zeros[iterator] = dex;
          iterator++;
        }
      }
    }// close j loop
  }// and close i loop


  for (int it = 0; it < iterator; it++) {

    int ip = grid[zeros[it]].getI();
    int jp = grid[zeros[it]].getJ();

    for (int iPos = ip - 1; iPos <= ip + 1; iPos++) {
      for (int jPos = jp - 1; jPos <= jp + 1; jPos++) { //------ iterate through the 8 tiles around the bomb
        int dex = getIndex(iPos, jPos); //-------------------- store position of tile under inspection
        if (dex != -1 && grid[dex].hidden) {//---------------------- if the position exists and is hidden
          grid[dex].reveal(); //-------------------------------- reveal tile
          if (grid[dex].value == 0) {
            zeros[iterator] = dex;
            iterator++;
          }
        }
      }// close j loop
    }// and close i loop
  }
}
};
