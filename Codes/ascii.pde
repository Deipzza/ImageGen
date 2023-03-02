void asciiCam() {
  fill(255);
  textAlign(LEFT);
  textSize(16);
  textFont(courier);
  textLeading(15);
  background(0);
  
  if (julia_color) {
    julia_color = false;
    colorMode(RGB, 255);
  }
  
  if (video.available()) {
    video.read();
  }
  
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
  
  text(asciiImage, 0, 50);
}
