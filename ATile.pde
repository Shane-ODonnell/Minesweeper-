
class Tile {
  int w;
  int i, j; //stores pos in grid map
  int index;
  boolean trapped, hidden, flagged;
  int value = 0; // stores proximity to trap

  Tile(int iVal, int jVal, int wVal, int inVal) {
    i = iVal;
    j = jVal;
    w = wVal;
    index = inVal;
    hidden = true; //   SET TRUE ONCE FINISHED TESTS
  }

  int getI() {
    return i;
  }

  int getJ() {
    return j;
  }

  boolean mouseOver() {
    int x1 = i*w;
    int x2 = x1 + w;

    int y1 = j*w;
    int y2 = y1 + w;

    if (x1 <= mouseX && mouseX <= x2 && y1 <= mouseY && mouseY <= y2)
      return true;

    return false;
  }

  boolean reveal() {
    if (!flagged) {
      hidden = false;
      return trapped;
    }
    return false;
  } //gameover? = reveal;

  void setBomb() {
    trapped = true;
  }

  void addV() {
    value++;
  }

  void flag() {
    if (hidden)
      flagged = !flagged;
  }


  void show() {

    if (hidden && !check) {
      fill(0, 200, 0); //if hidden be green
    } else if (trapped) {
      fill(200, 0, 0);//if trapped and not hidden be red
    } else {
      fill(0, 100, 0); //if safe, dark green and number
    }

    rect(i*w, j*w, w, w);

    if (flagged) {
      fill(200, 200, 0);
      ellipse(i*w + w/2, j*w + w/2, w/2, w/2);
    }

    if (!hidden && value != 0 && !trapped) { //if dark green and value not 0, display value
      fill(255);
      textAlign(CENTER, CENTER);
      text(value, i*w + w/2, j*w + w/2);
    }

    return;
  }
};
