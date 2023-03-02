import processing.video.*;

// General
boolean block_bg;
int frames = 0;

// ASCII cam
String density = "MN@#W9876543210?!abc;:+=,._ ";
Capture video;
PFont courier;

PFont c64;

// Julia fractal
float xoff = 0.0;
float yoff = 0.0;
boolean julia_color = false;

// Warning windows
PImage win_bg;
float window_x = random(width);
float window_y = random(height);
float window_width = random(200, 400);
float window_height = random(100, 250);

void displayName(String name) {
  fill(255);
  textSize(25);
  textAlign(CENTER);
  textFont(c64);
  text(name, width / 2, 25);
}

void setup() {
  size(1600, 900);
  courier = createFont("../Media/Fonts/Courier.ttf", 16);
  c64 = createFont("../Media/Fonts/C64_Pro_Mono-STYLE.ttf", 16);
  
  video = new Capture(this, 175, 60, 30);
  video.start();
  
  win_bg = loadImage("../Media/win_xp.jpg");
}

void draw() {
  frames += 1;
  if ((mouseX < width/2) && (mouseY < height/2)) {
    block_bg = false;
    asciiCam();
    displayName("ASCII Cam");
  } else if ((mouseX < width/2) && (mouseY > height/2)) {
    randomLetters();
    displayName("Colorful letters");
  } else if ((mouseX > width/2) && (mouseY < height/2)) {
    errorMsg();
    displayName("ERROR");
  } else if ((mouseX == width/2) || (mouseY == height/2)) {
    background(0);
  } else {
    block_bg = false;
    julia();
    displayName("Julia Fractal");
  }
}
