void colorSquare() {
  if (!block_bg) { // bloquear el fondo
    background(0);
    block_bg = true;
    
    // se escoge un color aleatorio para la figura cada vez que se ingresa en ella
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
    scale(0.95); // cuadros cada vez más pequeños
    rotate(radians(angle)); // cuadros cada vez más rotados
    fill(red_sq*i/9, green_sq-i*20, 200-blue_sq*i/4);
    square(0, 0, 700);
  }
  
  angle += 0.05;
  scale(168.9); // Se regresa a la escala que se tenia antes de realizar las iteraciones (La normal)
}
