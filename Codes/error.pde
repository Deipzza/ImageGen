void errorMsg() {
  if (!block_bg) {
    background(win_bg);
    block_bg = true;
  }
  
  if (julia_color) {
    julia_color = false;
    colorMode(RGB, 255);
  }
  
  float new_x =  window_x + 20;
  float new_y = window_y + 20;
  
  if (frames % 5 == 0) {
    if ((new_x < width) && (new_y < height)) {
      fill(255);
      stroke(4);
      rect(new_x, new_y, window_width, window_height, 10);
      fill(34, 75, 240);
      rect(new_x, new_y, window_width, window_height / 10, 10);
      noStroke();
      rect(new_x, new_y + (window_height / 20), window_width, window_height / 10);
      fill(0);
      textSize(window_width / 20);
      text("FATAL ERROR.\nRUN FOR YOUR LIFE", new_x + (window_width / 2), new_y + (window_height) / 2);
      
      window_x = new_x;
      window_y = new_y;
    } else {
      window_x = random(width);
      window_y = random(height);
      window_width = random(180, 400);
      window_height = random(100, 250);
    }
  }
}
