public class Block {
  
  private int xposition;
  private int yposition;
  private int hp;
  private boolean zapping;
  private boolean zapped;
  
  public Block(int _x) {
    xposition = _x;
    yposition = 0;
    hp = MAX_BLOCK_HP;
    
    zapping = false;
    zapped  = false;
  }
  
  public Block(int _x, int _y) {
    xposition = _x;
    yposition = _y;
    hp = getRandomHP();
    
    zapping = false;
    zapped  = false;
  }
  
  int getRandomHP() {
    return (int) random(MAX_BLOCK_HP);
  }
  
}