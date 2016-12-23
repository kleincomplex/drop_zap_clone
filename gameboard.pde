public class Gameboard {
    
  private int board_width;
  private int board_length;
  private int bg_x;
  private int bg_y;
  private int num_columns;
  private PImage bg_image;
  private ArrayList[] grid;
    
  // pass in the full window dimensions and the board gets auto defined from there
  public Gameboard (int window_x, int window_y, int cols) {
    bg_x = window_x;
    bg_y = window_y;
    num_columns = cols;
    bg_image = loadImage("background.png");
    grid = new ArrayList[NUM_COLUMNS];
  }
  
  // 
  void drawGameboard() {
    background(60);
    rectMode(CORNER);
    stroke(255);
    fill(131, 21, 123, 120);
    rect( SIDE_MARGINS, TOP_MARGIN,
          width - SIDE_MARGINS*2, height - TOP_MARGIN - BOTTOM_MARGIN);
          
    // draw vert lines
    // draw flat lines
    stroke(255);
    float x_step = (width - (SIDE_MARGINS * 2)) / NUM_COLUMNS ;
    for (float i = 1; i < NUM_COLUMNS ; i++) {
        line( SIDE_MARGINS + i*x_step, TOP_MARGIN, SIDE_MARGINS + i*x_step, height - BOTTOM_MARGIN);
    }
    float y_step = (height - (TOP_MARGIN + BOTTOM_MARGIN)) / NUM_ROWS ;
    for (float i = 1; i < NUM_ROWS ; i++) {
        line( SIDE_MARGINS, height - BOTTOM_MARGIN - y_step*i, 
          width - SIDE_MARGINS, height - BOTTOM_MARGIN - y_step*i);
    }
  }
  
  // Create a row of blocks. This happens in between drops
  void spawnNewRow() {
    for (int i = 0; i < NUM_COLUMNS ; i++) {
      grid[i].add(new Block(i) );
    }
  }
  
  void highlightHoverColumn() {
    if (mouseX < SIDE_MARGINS || mouseX > (width - SIDE_MARGINS)
          || mouseY < TOP_MARGIN || mouseY > (height - BOTTOM_MARGIN)) return;
          
    if (mousePressed) { fill(204, 120); }
    else { fill(200, 55);  }
    
    float cursor_x = mouseX - SIDE_MARGINS;
    float x_step = (width - (SIDE_MARGINS * 2)) / NUM_COLUMNS ;
    int quadrant = floor( cursor_x / x_step ); 
    rectMode(CORNER);
    stroke(0);
    rect (SIDE_MARGINS + quadrant * x_step, TOP_MARGIN,
            x_step, height - BOTTOM_MARGIN - TOP_MARGIN);
  }
  
  void dropBlockOntoQuad(int quadrant ) {
    
  }
  
}