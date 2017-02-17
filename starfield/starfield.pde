Star[] stars = new Star[1000];

float speed;

void setup() {
  size(1200, 900);  
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  speed = map(mouseY, 0, height, 0, 30);
  background(0);
  translate(width / 2, height / 2);
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
}