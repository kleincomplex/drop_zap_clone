public class Block {
  
  //private int xposition;
  //private int yposition;
  private int hp;
  private boolean zapping;
  private boolean zapped;
  
  public Block() {
    //xposition = _x;
    //yposition = 0;
    hp = getRandomSize();
    
    zapping = false;
    zapped  = false;
  }
  
  //public Block(int _x, int _y) {
  //  xposition = _x;
  //  yposition = _y;
  //  hp = getRandomSize();
    
  //  zapping = false;
  //  zapped  = false;
  //}
   public Block(int _size) {
    hp = _size;
    
    zapping = false;
    zapped  = false;
  }
  
  public void drawBlockToDrop(int size) {
    
  }
  
  private int getRandomSize() {
    return (int) random(MAX_BLOCK_SIZE);
  }
  
  private int getSize() {
    return this.hp;
  }
  
}