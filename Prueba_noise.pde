class Walker {
  int x;
  int y;
  
  Walker() {
    x = width / 2;
    y = height / 2;
  }
  
  void display() {
    stroke(0);
    circle(x, y, 5);
  }
  
  void step() {
    int choice = int(random(4));
    
    if (choice == 0) {
      x +=5;
    } else if (choice == 1) {
      x -=5;
    } else if (choice == 2) {
      y +=5;
    } else {
      y -=5;
    }
  }
}

Walker w;

void setup() {
  size(640,360);
  w = new Walker();
  background(255);
}

void draw() {
  w.step();
  w.display();
}
