// 12/18 JKLEIN
//

Gameboard game;
Block blockToDrop;
int spawn_counter = 0;
static final int NUM_COLUMNS = 7;
static final int NUM_ROWS = 10;
static final int X_SIZE  = 480;
static final int Y_SIZE  = 640;
static final int MAX_BLOCK_SIZE  = 5;
static final float SIDE_MARGINS  = 45;
static final float TOP_MARGIN    = 75;
static final float BOTTOM_MARGIN = 25;

int GAME_STATE;
static final int PHASE_SPAWN   = 0;
static final int PHASE_CHOOSE  = 1;
static final int PHASE_FALL    = 2;
static final int PHASE_ZAP     = 3;
static final int PHASE_GAMEEND = 9;

// Initialize
void setup() {
 size(480, 640); 
 game = new Gameboard(width, height, NUM_COLUMNS);
 blockToDrop = new Block();
 GAME_STATE = PHASE_SPAWN;
 frameRate(30);
}

// Draw every frame, handle flow of the game
void draw() {
  game.drawGameboard();
  
  if (GAME_STATE == PHASE_SPAWN  )
  {
    updateSpawn();
  }
  if (GAME_STATE == PHASE_CHOOSE )
  {
    game.highlightHoverColumn();
    game.drawBlockToDrop();
  }
}

void updateSpawn() {
  spawn_counter++;
  if (spawn_counter >= 10) {
    GAME_STATE = PHASE_CHOOSE;
    spawn_counter = 0;
  }
}

// Handle mouse input
void mousePressed() {
  
}
void mouseReleased() {
  if (GAME_STATE == PHASE_CHOOSE ) {
    float cursor_x = mouseX - SIDE_MARGINS;
    float x_step = (width - (SIDE_MARGINS * 2)) / NUM_COLUMNS ;
    int quadrant = floor( cursor_x / x_step );  
    game.dropBlockOntoQuad(quadrant, blockToDrop.getSize());
  }
}

// Handle keyboard input
void keyPressed() {
 if (key == 'q' || key == 'Q') exit();
 if (key == 'r' || key == 'r') setup();
}