import processing.video.*;

String density = "N@#W9876543210?!abc;:+=,._ ";
//String density = " ·.:,;#'+*`=?!¬#^˜·$%/()";
Capture video;
PFont courier;
PFont c64;
boolean right;


void setup() {
  size(1600, 900);
  courier = createFont("../Fonts/Courier.ttf", 16);
  c64 = createFont("../Fonts/C64_Pro_Mono-STYLE.ttf", 16);
  textFont(courier);
  //textFont(c64);
  textLeading(16);
  video = new Capture(this, 175, 60, 30);
  video.start();
}

void draw() {
  if (mouseX <= width/2) {
    right = false;
    fill(255);
    
    if (video.available()) {
      video.read();
    }

    textSize(16);
    textLeading(16);
    background(0);
    
    video.loadPixels();
    String asciiImage = "";
    
    for (int j = 0; j < video.height; j++) {
      for (int i = 0; i < video.width; i++) {
        int pixelIndex = (i + (j * video.width));
        float r = red(video.pixels[pixelIndex]);
        float g = green(video.pixels[pixelIndex]);
        float b = blue(video.pixels[pixelIndex]);
        float avg = (r + g + b) / 3;
        int len = density.length();
        int charIndex = floor(map(avg, 0, 255, len-1, 0));
        
        char c = density.charAt(charIndex);
        if (c == ' ') {
          asciiImage += " ";
        } else {
          asciiImage += c;
        }
      }
      asciiImage += "\n";
    }
    
    text(asciiImage, 0, 0);
    
    } else {
      if (!right) {
        background(220);
        right = true;
      }
      
      noStroke();
      fill(random(255), random(255), random(255), random(255)); //r, g, b, a
      circle(random(width), random(height), random(20));
    }
}
