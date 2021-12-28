

int scale = 20;
int w = 1800, h = 1000;
int cols, rows;
float[][] z;
float noise_step = 0.2;
float zoff = 0;

float angle;
float jitter;


void setup() {
  size(1024, 768, P3D);
  frameRate(3);

  cols = round(w / scale);
  rows = round(h / scale);

}

void draw() {

  background(255);


  directionalLight(70, 130, 180, -1, 0, -2);

  pushMatrix();

if (second() % 2 == 0) { 
    jitter = random(-2, 2);
  }
  angle = angle + jitter;
  float c = cos(angle);
  translate(500, 400, 0);
  rotate(c);

  fill(255);
  stroke(10);
  sphereDetail(5);
  sphere(100);

  popMatrix();



  stroke(10);
  noFill();

  translate(width / 2, height / 1.7);
  rotateX(PI * -2);
  rotateY(PI/ -2);

  translate(-w / 2, -h / 2 + 50);

  z = new float[cols][rows];
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      z[x][y] = map(noise(x * noise_step, y * noise_step -zoff), 0, 1, -100, 100);
    }
  }
  zoff += 0.1;

  for (int y = 0; y < rows - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x * scale, y * scale, z[x][y]);
      vertex(x * scale, (y + 1) * scale, z[x][y+1]);
    }
    endShape();
  }

  stroke(#B22222);
  noFill();

  translate(width / 2, height / 2);
  rotateX(PI * -3);
  rotateY(PI / 2);

  translate(-w / 2, -h / 2 + 50);

  z = new float[cols][rows];
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      z[x][y] = map(noise(x * noise_step, y * noise_step -zoff), 0, 1, -100, 1000);
    }
  }
  zoff += 0.1;

  for (int y = 0; y < rows - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x * scale, y * scale, z[x][y]);
      vertex(x * scale, (y + 1) * scale, z[x][y+1]);
    }
    endShape();
  }

}
