int initial_pos = 4;
int actual_pos = 4;

void smallerLines() {
  background(220);
  
  line(actual_pos, 0, actual_pos, 500);
  line(0, actual_pos, 500, actual_pos);
  actual_pos += 50;
  
  if(actual_pos > height) {
    initial_pos += 55;
    actual_pos = initial_pos;
  }
}
