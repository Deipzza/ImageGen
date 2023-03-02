void randomLetters() {
  if (!right) {
    background(0);
    right = true;
  }
  System.out.println(g.backgroundColor);

  noStroke();
  fill(random(255), random(255), random(255), random(255)); //r, g, b, a
  textSize(random(30));
  text(char(int(random(33, 126))), random(width), random(height));
  //circle(random(width), random(height), random(20));
}
