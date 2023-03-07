void asciiCam() {
  // configuración básica de la tipografía
  fill(255);
  textAlign(LEFT);
  textSize(15);
  textFont(courier);
  textLeading(15);
  background(0);
  
  if (julia_color) { // volver a escala de colores RGB en caso de venir desde Julia
    julia_color = false;
    colorMode(RGB, 255);
  }
  
  if (color_ascii) {
    color_ascii = false;
    red_ascii = random(128, 255);
    green_ascii = random(128, 255);
    blue_ascii = random(128, 255);
  }
  
  if (video.available()) {
    video.read();
  }
  
  video.loadPixels(); // cargar el arreglo de pixeles del video
  
  String asciiImage = "";
  
  for (int j = 0; j < video.height; j++) {
    for (int i = 0; i < video.width; i++) {
      int pixelIndex = (i + (j * video.width));
      // Obtener los valores de color del pixel y promediar para asignarle un caracter de acuerdo a su "intensidad" o brillo
      float r = red(video.pixels[pixelIndex]);
      float g = green(video.pixels[pixelIndex]);
      float b = blue(video.pixels[pixelIndex]);
      float avg = (r + g + b) / 3;
      int len = density.length();
      int charIndex = floor(map(avg, 0, 255, len-1, 0));
      char c = density.charAt(charIndex);
      
      asciiImage += c; // concatenar el caracter
    }
    asciiImage += "\n";
  }
  fill(red_ascii, green_ascii, blue_ascii);
  text(asciiImage, 0, 14); // mostrar
}
