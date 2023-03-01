float angle = 0;

void setup(){
  size(800, 600);
  colorMode(RGB, 1);
}

void draw(){
  background(255);
  
  float w = 5;
  float h = (w * height)/ width;
  
  float xmin = -w/2;
  float ymin = -h/2;
  
  loadPixels();
  
  int max_iter = 100;
  
  float xmax = xmin + w;
  float ymax = ymin + h;
  
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
        float two_ab = 2.0 * a * b;
        
        // redefino para hacer "efectiva" la iteracion
        a = aa - bb + x;
        b = two_ab + y;
        
        if (a*a + b*b > 20){
          break;
        }
        iter++;
      }
      if (iter == max_iter){
        pixels[i+j*width] = color(0);
      } 
      else {
        pixels[i+j*width] = color(sqrt(float(iter) / max_iter));
      }
      x += dx;
    }
    y += dy;
    
  }
  updatePixels();
}
