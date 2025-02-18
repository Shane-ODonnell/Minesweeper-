class Map {

  int size, numBombs;
  Tile [] grid; // declare array of tiles called grid


  Map(int S) {
    size = S;                                       // assign size
    int iterator = 0;
    int w = floor(width / size) ;
    grid = new Tile [size*size];                    // initialise grid as an array of tiles of size S
    numBombs = floor(0.13 * size * size);           // approx 13% of the tiles are bombs
    //println("Number of Bombs: "+numBombs);          //Troubleshooting
    int [] bombSpots = new int [numBombs];          // locally initialise an array to store the locations of the bombs


    //---------------------------------------------------------------------------------------------------------------------------- // Give every tile in grid a unique i and j position

    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        grid[iterator] = new Tile(i, j, w, iterator);         //initalise every tile in the grid
        iterator++;
      }
    }

    //---------------------------------------------------------------------------------------------------------------------------- // choose tiles that house bombs

    for (int i = 0; i < numBombs; i++) {
      bombSpots[i] = floor(random(1) * size* size); //choose random locations for bombs

      //println("bomb " + i + " is at: " + bombSpots[i]); //Troubleshooting

      for (int j = i - 1; j >= 0; j--) {
        if (bombSpots[i] == bombSpots[j])            // if two bombs are placed in the same spot
          i--;                                       //decrease the counter so that we can pick a new bomb spot
      }
    }

    //---------------------------------------------------------------------------------------------------------------------------- // add bombs to chosen tiles and update values of the surrounding tiles

    for (int it = 0; it < numBombs; it++) {
      int pos = bombSpots[it]; //------------------------------- store index of bomb under inspection
      int i = grid[pos].getI();
      int j = grid[pos].getJ(); //------------------------------ store i and j of the bomb

      grid[pos].setBomb(); // ---------------------------------- add a bomb to that tile

      //-------------------------------------------------------- now we need to increas the value of the 8 tiles around the bomb by 1

      for (int iPos = i - 1; iPos <= i + 1; iPos++) {
        for (int jPos = j - 1; jPos <= j + 1; jPos++) { //------ iterate through the 8 tiles around the bomb
          int dex = getIndex(iPos, jPos); //-------------------- store position of tile under inspection
          if (dex != -1 && dex != pos) {//---------------------- if the position exists and not containing the bomb
            grid[dex].addV(); //-------------------------------- increase value of tile at index
          }
        }// close j loop
      }// and close i loop
    }
  } //---------------------------------------------------------------------------------------------------------------------------- // end of constructor






  //need to randomly assign tiles as bombs and then assing the rest of the tiles a value
