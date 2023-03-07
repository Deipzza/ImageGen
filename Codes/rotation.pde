void colorSquare() {
  if (!block_bg) { // bloquear el fondo
    background(0);
    block_bg = true;
    
    red_sq = random(255);
    green_sq = random(255);
    blue_sq = random(255);
  }
  
  if (julia_color) { // volver a escala de colores RGB en caso de venir desde Julia
    julia_color = false;
    colorMode(RGB, 255);
  }
  
  // organizar el canvas
  strokeWeight(25);
  translate(width / 2, height / 2);
  
  for (int i=0; i<100; i++) { // generación de los cuadros
    scale(0.95);
    rotate(radians(angle));
    fill(red_sq*i/9, green_sq-i*20, 200-blue_sq*i/4);
    //fill(red_sq*i/4, -green_sq*i, blue_sq*i/6);
    square(0, 0, 700);
  }
  
  angle += 0.05;
  scale(168.9);
}
