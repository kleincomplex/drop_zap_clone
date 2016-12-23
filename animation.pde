public abstract class Animation {
  
  protected int progress;
  protected int rate;

  public Animation(int _rate) {
    progress = 0;
    rate = _rate;
  }
  
  abstract void draw_frame();
  
  public int update()  {
    this.progress += this.rate;
    if (progress >= 100)
      return 1;
    else
      return 0;
  }
}

public class DropAnimation extends Animation {
  
  public DropAnimation() {
    super(5);
  }
  
  void draw_frame() {
  }
}

public class ZapAnimation extends Animation {
    
  public ZapAnimation() {
    super(10);
  }
  
  void draw_frame() {
    
  }
}