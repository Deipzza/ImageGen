float angle = 0;
float grosor = 0;
float r = 200;

void setup(){
  frameRate(60);
  size(800,600);
  background(255);
}

int total = 200;
float[] lineas = new float[total];

int contador = 0;
void draw(){
  background(0);
  translate(width/2, height/2);
  while(contador < total){
    float y1 = sin(angle);
    float x1 = cos(angle);
    float y2 = -y1;
    float x2 = -x1;
    
    lineas[contador] = x1*300;
    lineas[contador+1] = y1*300;
    lineas[contador+2] = x2*300;
    lineas[contador+3] = y2*300;
    
    angle += 0.07;
    contador += 4;
  }
  
  for (int i=0; i<total/4; i++){
    stroke(random(255), random(255), random(255));
    strokeWeight(6*abs(sin(grosor)));
    line(lineas[4*i], lineas[4*i+1], lineas[4*i+2], lineas[4*i+3]);
    grosor += 0.001;
  }
  contador = 0;
}
