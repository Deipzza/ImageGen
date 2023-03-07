void julia(){
  if (!julia_color) {
    colorMode(HSB, 1);
    julia_color = true;
  }
  
  background(255); 
  
  // Se introduce ruido a la variable C
  xoff = xoff + 0.02;
  yoff = yoff - 0.01;
  float ca = noise(xoff)-0.75;
  float cb = cos(yoff)/1.2;
  
  // Se establecen los rangos de valores del "Plano complejo"
  float w = 5;
  float h = (w * height)/ width;  
  float xmin = -w/2;
  float ymin = -h/2;
  float xmax = xmin + w;
  float ymax = ymin + h;
  
  float dx = (xmax - xmin) / (width); // tamaño de paso en x
  float dy = (ymax - ymin) / (height); // tamaño de paso en y
  
  loadPixels();   // Se cargan los pixeles del array "pixels"
  int max_iter = 20; // Se establece el maximo de iteraciones para la sucesion
  
  // Para cada valor de x, y en el plano complejo, con tamaño de paso dx, dy 
  // se realizan las iteraciones
  float y = ymin;
  for (int j = 0; j < height; j++){
    float x = xmin;
    for (int i = 0; i < width; i++){
      
      // Iteramos z = z^2 + c
      float a = x;
      float b = y;
      int iter = 0;
      while(iter < max_iter){
        float aa = a * a;
        float bb = b * b;
        if (aa + bb > 4.0){
          break;
        }
        
        float two_ab = 2.0 * a * b;
        a = aa - bb + ca;
        b = two_ab + cb;
        iter++;
      }
      
      // Se colorean los pixeles segun la cantidad de iteraciones que soportan
      if (iter == max_iter){
        pixels[i+j*width] = color(0); 
      } 
      else {
        float hu = sqrt(float(iter) / max_iter);
        pixels[i+j*width] = color(hu, 255, 150);
      }
      x += dx; // se pasa al siguiente valor en x
    }
    y += dy; // se pasa al siguiente valor de y
    
  }
  updatePixels(); // Se actualiza el array pixels con los pixeles generados en las iteraciones
  
  // Determinar un alpha dependiendo de hacia que direccion se mueve el mouse (vertical u horizontal) y ubicarlo
  alpha = ((mouseX >= width/2) && (mouseX <= 2*width/3)) ? map(mouseX, 2*width/3, width/2, 0, 1) : map(mouseY, 5*height/8, height/2, 0, 1);
  fill(0, alpha);
  square(0, 0, 2000);
}
