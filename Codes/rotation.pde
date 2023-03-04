void colorSquare() {
  if (julia_color) { // volver a escala de colores RGB en caso de venir desde Julia
    julia_color = false;
    colorMode(RGB, 255);
  }
  
  // organizar el canvas
  strokeWeight(25);
  background(0);
  translate(width / 2, height / 2);
  
  for (int i=0; i<100; i++) { // generación de los cuadros
    scale(0.95);
    rotate(radians(angle));
    fill(i*10, 100-i*20, 200-i*10);
    rect(0, 0, 700, 700);
  }
  
  angle += 0.05;
}
