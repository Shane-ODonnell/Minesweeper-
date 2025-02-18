//High score: 10
Map testMap;
boolean turn1;
boolean gameOver;
boolean gameWon;
boolean ended;
boolean check = false;

PImage GameOver;
PImage GameWin;
int startT;
int endT;
void setup() {
  size(800, 800);
  background(0, 0, 100);
  GameOver = loadImage("GameOver.png");
  GameWin = loadImage("GameWin.png");

  int rows = 8;
  testMap = new Map(rows);
  textSize(floor(100 / (rows / 5)));
  textSize(floor(100 / (rows / 5)));

  turn1 = true;
  gameOver = false;
  gameWon = false;
  ended = false;

  //println("-------------");
}

void draw() {
  testMap.show();

  if (gameOver) {
    testMap.end();// reveal all tiles
    image(GameOver, 0, 0, width, height);
  } else if (testMap.win()) {
    if(!gameWon){
      endT = floor((millis() - startT) * 0.001);
    }
    gameWon = true;
    image(GameWin, 0, 0, width, height);
    fill(0,200,0);
    if(endT > 99)
    endT = 99;
    //text(endT,width/2,height/2 + height/7);
    numberDisplay(width/2 - floor(width/10.5), height/2 + height/7, endT, 2);
    
  }
}

void mousePressed() {
  if (ended || gameWon) {
    setup();
  } else if (mouseButton == LEFT) {
    testMap.reveal();
  } else if (mouseButton == RIGHT) {
    testMap.flag();
  }
  if (turn1)
    startT = millis();
  turn1 = false;
}

void keyPressed() {
  if (key == 'r'|| key == 'R') {
    check = !check;
  }
}
