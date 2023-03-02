void clock() {
  background(220);
  translate(width / 2, height / 2);
  int radius = 350;
  
  fill(0);
  circle(0, 0, 10);
  circle(0, 0, radius * 2);
  fill(220);
  circle(0, 0, (radius * 2) - 10);
  fill(0);
  circle(0, 0, 10);
  
  float seconds_rad = radians(second() * 6);
  float minutes_rad = radians(minute() * 6);
  float hours_rad = radians(hour() * 30);
  
  stroke(0);
  strokeWeight(16);
  pushMatrix();
  rotate(seconds_rad);
  line(0, 0, 0, -325);
  popMatrix();
  
  pushMatrix();
  rotate(minutes_rad);
  line(0, 0, 0, -290);
  popMatrix();
  
  pushMatrix();
  rotate(hours_rad);
  line(0, 0, 0, -245);
  popMatrix();
}
