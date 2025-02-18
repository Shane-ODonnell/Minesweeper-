void numberDisplay(int x, int y, int num, int  size) {
  //background(150);
  // each of the grids is 6 wide and 15 tall seperated by a width of 1
  boolean on = true;
  int scale = 9;
  int w = 8 * scale;
  int h = 15 * scale;
  int gap = 1 * scale;

  int zw = floor(0.5*w); // = 4 * scale
  int zh = gap; // = 1 * scale
 
  int[] panelX = new int[size];

  for (int X = 0; X < size; X++) {
    panelX[X] = x + X*gap + X*w;  //= { x, x + gap + w, x + 2*gap + 2*w}
  }

  //cooridinates for the top left x coordinate of each panel

  int[] digits = new int[size];
  color  ziffern = #a8e61d;//this is the color that the number will be displayed in on the panel
  int spot = 0;
 
  digits[spot] = (num / 10) % 10;
  spot++;
  digits[spot] = num % 10;

  color surfaceC = #464646;
  color darNums = #4c4c4c;
  //color green = #a8e61d;

  stroke(surfaceC);
  //draw size count surfaces to display numbers on x + gap*i + w*i
  for (int i = 0; i < size; i++) {
    fill(surfaceC);
    rect(panelX[i], y, w, h);//create the surfaces

    fill(darNums);//create the dark eights
    for (int k = 2; k <= 12; k = k + 5) {
      rect(panelX[i]+ 2*scale, y + k*scale, zw, zh);
    }
    for (int m = 1; m <= 6; m = m + 5) {
      rect(panelX[i]+ m*scale, y+ 3*scale, zh, zw);
      rect(panelX[i]+ m*scale, y+ 8*scale, zh, zw);
    }

    int val = digits[i];
    fill(ziffern); //done with 1 3

    // if the first digit == 0 or the first two digits == 0
    //search the digits array for the first val that isnt 0, if we arent at that spot yet then do nothing
    int index = 0;
    for (int g = 0; g < size; g++) {
      if (digits[g] != 0) {
        index = g;
        g = size;
      }
    }
    //now index has the first space of the number that isnt 0
    if ((val == 0 && i < index ) || on == false) {
      //do nothing
    } else {
      if ( val != 2) {// draw bottom right line
        rect(panelX[i]+ 6*scale, y+ 8*scale, zh, zw);
      }
      if (val != 5 && val !=6) {// draw top right line
        rect(panelX[i]+ 6*scale, y+ 3*scale, zh, zw);
      }
      if (val != 1 && val !=4) {// draw top line
        rect(panelX[i]+ 2*scale, y + 2*scale, zw, zh);
      }
      if (val != 1 && val !=0 && val != 7) {// draw mid line
        rect(panelX[i]+ 2*scale, y + 7*scale, zw, zh);
      }
      if (val != 1 && val !=4 && val != 7) {// draw bottom line
        rect(panelX[i]+ 2*scale, y + 12*scale, zw, zh);
      }
      if (val != 1 && val !=2 && val != 3 && val != 7) {// draw top left line
        rect(panelX[i]+ 1*scale, y+ 3*scale, zh, zw);
      }
      if (val != 1 && val !=4 && val != 3 && val != 7 && val != 5 && val != 9) {// draw bottom left line
        rect(panelX[i]+ 1*scale, y+ 8*scale, zh, zw);
      }
    }
  }
  stroke(0);
}
