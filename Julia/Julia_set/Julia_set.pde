float angle = 0;

void setup(){
  size(800, 600);
  colorMode(HSB, 1);
}

void draw(){
  background(255);
  
  float ca = 0.27;
  float cb = 0.49;
  
  float w = 5;
  float h = (w * height)/ width;
  
  float xmin = -w/2;
  float ymin = -h/2;
  
  float xmax = xmin + w;
  float ymax = ymin + h;
  
  loadPixels();
  int max_iter = 100;
  
  float dx = (xmax - xmin) / (width);
  float dy = (ymax - ymin) / (height);
  
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
      if (iter == max_iter){
        pixels[i+j*width] = color(0);
      } 
      else {
        float hu = sqrt(float(iter) / max_iter);
        pixels[i+j*width] = color(hu, 255, 150);
      }
      x += dx;
    }
    y += dy;
    
  }
  updatePixels();
}
