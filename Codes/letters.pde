// Proximamente (posiblemente) ventanas emergentes u otra cosa

void randomLetters() {
  if (!block_bg) {
    background(0);
    block_bg = true;
  }
  
  if (julia_color) {
    julia_color = false;
    colorMode(RGB, 255);
  }

  noStroke();
  fill(random(255), random(255), random(255), random(255)); //r, g, b, a
  textSize(random(30));
  text(char(int(random(33, 126))), random(width), random(height));
}
