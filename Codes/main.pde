import processing.video.*; // librería para la captura de video desde la cámara

// VARIABLES GLOBALES
// General
boolean block_bg;
int frames = 0;

// ASCII cam
String density = "@WMN#9876543210?abc!;:+=_,. ";
Capture video;
PFont courier;

// Warning windows
PFont c64;
PImage win_bg;
float window_x = random(width);
float window_y = random(height);
float window_width = random(200, 400);
float window_height = random(100, 250);

// Square
float angle;

// Julia fractal
float xoff = 0.0;
float yoff = 0.0;
boolean julia_color = false;

void setup() {
  size(1600, 900);
  courier = createFont("../Media/Fonts/Courier.ttf", 15);
  c64 = createFont("../Media/Fonts/C64_Pro_Mono-STYLE.ttf", 15);
  
  video = new Capture(this, 182, 60, 30); // resolución del video. Los valores puestos concuerdan para la resolución de la ventana
  video.start();
  
  win_bg = loadImage("../Media/win_xp.jpg"); // background de win XP
}

void draw() {
  frames += 1;
  if ((mouseX <= width/2) && (mouseY <= height/2)) { // cuadrante superior izquierdo
    rectMode(CORNER);
    block_bg = false;
    asciiCam();
  } else if ((mouseX <= width/2) && (mouseY > height/2)) { // cuadrante inferior izquierdo
    rectMode(CENTER);
    colorSquare();
  } else if ((mouseX > width/2) && (mouseY <= height/2)) { // cuadrante superior derecho
    rectMode(CORNER);
    errorMsg();
  } else { // cuadrante inferior derecho
    rectMode(CORNER);
    block_bg = false;
    julia();
  }
}
