import processing.video.*;

String density = "MN@#W9876543210?!abc;:+=,._    ";
String density_2 = "   N@#W9876543210?!abc;:+=,._ ";
//String density = " ·.:,;#'+*`=?!¬#^˜·$%/()";
Capture video;
PFont courier;
PFont c64;
boolean block_bg;
int frames = 0;
float xoff = 0.0;
float yoff = 0.0;

void displayName(String name) {
  fill(255);
  textSize(25);
  textAlign(CENTER);
  textFont(c64);
  text(name, width / 2, 25);
}

void setup() {
  size(1600, 900);
  courier = createFont("../Fonts/Courier.ttf", 16);
  c64 = createFont("../Fonts/C64_Pro_Mono-STYLE.ttf", 16);
  
  video = new Capture(this, 175, 60, 30);
  video.start();
}

void draw() {
  if ((mouseX <= width/2) && (mouseY <= height/2)) {
    block_bg = false;
    asciiCam();
    displayName("ASCII Cam");
  } else if ((mouseX <= width/2) && (mouseY > height/2)) {
    randomLetters();
    displayName("Colorful letters");
  } else if ((mouseX > width/2) && (mouseY <= height/2)) {
    block_bg = false;
    clock();
    displayName("?");
  } else {
    block_bg = false;
    julia();
    displayName("Julia Fractal");
  }
}
