// 12/18 JKLEIN
// 12/25 JKLEIN - merryy xmas

Game drop_zap_clone;

// Initialize
void setup() {
 size(480, 640); 
 frameRate(30);
 drop_zap_clone = new Game();
}

// Draw every frame, handle flow of the game
void draw() {
  drop_zap_clone.Draw();
}

// Handle mouse input
void mousePressed() {
  drop_zap_clone.mousePressed();
}
void mouseReleased() {
  drop_zap_clone.mouseReleased();
}

// Handle keyboard input
void keyPressed() {
 if (key == 'q' || key == 'Q') exit();
 if (key == 'r' || key == 'r') setup();
}