
// The grid aka gameboard
public class Gameboard {

  static final float SIDE_MARGINS  = 45;
  static final float TOP_MARGIN    = 75;
  static final float BOTTOM_MARGIN = 25;  

  private int num_columns;
  private int num_rows;
  private float cell_length;

  //private PImage bg_image;
  private ArrayList<ArrayList> grid;

  // pass in the full window dimensions and the board gets auto defined from there
  public Gameboard (int cols, int rows) {
    num_columns = cols;
    num_rows = rows;
    grid = new ArrayList<ArrayList>();
    for (int i = 0; i < num_columns; i++) {
      grid.add( new ArrayList<Block>(num_rows));
    }
    cell_length = (width - (SIDE_MARGINS * 2)) / num_columns;
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
    for (float i = 1; i < num_columns; i++) {
      line( SIDE_MARGINS + i*cell_length, TOP_MARGIN, SIDE_MARGINS + i*cell_length, height - BOTTOM_MARGIN);
    }
    for (float i = 1; i < num_rows; i++) {
      line( SIDE_MARGINS, height - BOTTOM_MARGIN - cell_length*i, 
        width - SIDE_MARGINS, height - BOTTOM_MARGIN - cell_length*i);
    }
  }

  // Create a row of blocks. This happens in between drops
  void spawnNewRow() {
    for (int i = 0; i < num_columns; i++) {
      grid.get(i).add(new Block() );
    }
  }

  public int getColumnHoveredOver() {
    float cursor_x = mouseX - SIDE_MARGINS;
    float x_step = (width - (SIDE_MARGINS * 2)) / num_columns ;
    return floor( cursor_x / x_step );
  }

  void highlightHoverColumn() {
    if (mouseX < SIDE_MARGINS || mouseX > (width - SIDE_MARGINS)
      || mouseY < TOP_MARGIN || mouseY > (height - BOTTOM_MARGIN)) return;

    if (mousePressed) { 
      fill(204, 120);
    } else { 
      fill(200, 55);
    }

    int column = getColumnHoveredOver();
    rectMode(CORNER);
    stroke(0);
    rect (SIDE_MARGINS + column * cell_length, TOP_MARGIN, 
      cell_length, height - BOTTOM_MARGIN - TOP_MARGIN);
  }

  ////////////// dropBlockOntoQuad
  // Returns 1 if the result of adding to this column is an overflow
  public int dropBlockOntoQuad(int column, int size ) {
    if (column < 0) return 0; // probably throw some error or something
    if (column > (num_columns - 1))  return 0;
    grid.get(column).add(new Block(size));
    if (grid.get(column).size() > num_columns) return 1;
    return 0;
  }
}