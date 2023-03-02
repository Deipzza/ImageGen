// Proximamente (posiblemente) ventanas emergentes u otra cosa

void randomLetters() {
  if (!block_bg) {
    background(0);
    block_bg = true;
  }

  noStroke();
  fill(random(255), random(255), random(255), random(255)); //r, g, b, a
  textSize(random(30));
  text(char(int(random(33, 126))), random(width), random(height));
}
