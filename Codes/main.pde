import processing.video.*; // librería para la captura de video desde la cámara

// VARIABLES GLOBALES
// General
boolean block_bg;
boolean fade = false;
int frames = 0;
float alpha;

// ASCII cam
String density = "@WMN#9876543210?abc!;:+=_,. ";
Capture video;
PFont courier;
boolean color_ascii = true;
float red_ascii;
float green_ascii;
float blue_ascii;

// Warning windows
PFont c64;
PImage win_bg;
float window_x = random(width);
float window_y = random(height);
float window_width = random(200, 400);
float window_height = random(100, 250);

// Rotaring squares
float angle;
float red_sq;
float green_sq;
float blue_sq;

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
    color_ascii = true;
  } else if ((mouseX > width/2) && (mouseY <= height/2)) { // cuadrante superior derecho
    rectMode(CORNER);
    errorMsg();
    color_ascii = true;
  } else { // cuadrante inferior derecho
    rectMode(CORNER);
    block_bg = false;
    julia();
    color_ascii = true;
  }
  
  // Desvanecimiento horizonal
  if ((mouseX >= width/6) && (mouseX <= width/2)) { // izq - der
    alpha = map(mouseX, width/6, width/2, 0, 255);
    fill(0, alpha);
    strokeWeight(0);
    square(0, 0, 2000);
  } else if ((mouseX >= width/2) && (mouseX <= 2*width/3) && (mouseY <= height/2)) { // der - izq
    alpha = map(mouseX, 2*width/3, width/2, 0, 255);
    fill(0, alpha);
    strokeWeight(0);
    square(0, 0, 2000);
    block_bg = false;
  }
  
  // Desvanecimiento vertical
  if ((mouseY >= 3*height/8) && (mouseY <= height/2)) { // arr - aba
    alpha = map(mouseY, 3*height/8, height/2, 0, 255);
    fill(0, alpha);
    strokeWeight(0);
    square(0, 0, 2000);
    block_bg = false;
  } else if ((mouseY >= height/2) && (mouseY <= 5*height/8) && (mouseX < width/2)) { // aba - arr
    alpha = map(mouseY, 5*height/8, height/2, 0, 255);
    fill(0, alpha);
    strokeWeight(0);
    square(0, 0, 2000);
  }
}
