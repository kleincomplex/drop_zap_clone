public static enum GameState {
  SPAWN_ANIM, CHOOSE, FALL_ANIM, ZAP_ANIM, GAMEOVER
}

public class Game {
  // All the game options here
  static final int NUM_COLUMNS = 7;
  static final int NUM_ROWS = 10;
  static final int X_SIZE  = 480;
  static final int Y_SIZE  = 640;

  // Member variables
  public Block blockToDrop;
  public GameState state;
  public Gameboard board;
  public ArrayList<Animation> animation_queue;

  // Constructor
  public Game() {
    board = new Gameboard(NUM_COLUMNS, NUM_ROWS);
    blockToDrop = new Block();
    //state = GameState.SPAWN_ANIM;
    state = GameState.CHOOSE;
  }

  // Draw every frame
  public void Draw() {
    board.drawGameboard();

    if (state == GameState.SPAWN_ANIM  )
    {
      //updateSpawn();
    }
    if (state == GameState.CHOOSE )
    {
      board.highlightHoverColumn();
      
    }
  }

  void updateSpawn() {
    //spawn_counter++;
    //if (spawn_counter >= 10) {
    //  GAME_STATE = PHASE_CHOOSE;
    //  spawn_counter = 0;
    //}
  }

  public void mouseReleased() {
    if (state == GameState.CHOOSE ) {
      int quadrant = board.getColumnHoveredOver();  
      board.dropBlockOntoQuad(quadrant, blockToDrop.getSize());
    }
  }
  
  public void mousePressed() {
    
  }
  
  public void drawBlockToDrop( ) {
    
  }
}