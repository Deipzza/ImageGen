import processing.video.*;

String density = "N@#W9876543210?!abc;:+=,._ ";
Capture video;
PFont courier;

void setup() {
  size(1600, 900);
  courier = createFont("Courier.ttf", 16);
  textFont(courier);
  textLeading(16);
  video = new Capture(this, 175, 60, 30);
  video.start();
}

void draw() {
  if (mouseX <= width/2) {
    
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
      textSize(100);
      background(0);
      text("Pipo", width/3, height/2);
    }
}
