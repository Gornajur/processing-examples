
int scale = 30;
int w = 1800, h = 1000;
int cols, rows;
float[][] z;
float noise_step = 0.2;
float zoff = 0;
float angle = PI /200;
float jitter;
float angle2;



void setup() {
  size(1024, 768, P3D);

  cols = round(w / scale);
  rows = round(h / scale);
  frameRate(9);

}

void draw() {

  background(0);

  stroke(30);
  //strokeWeight(2);
  fill(#5F9EA0);


  translate(width / 2.5, height / 1.7);
  rotateX(PI + 20);
  rotateY(PI);
  rotateZ(-100);

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
      vertex(x * scale, (y - 1) * scale, z[x][y+1]);
    }
    endShape();
  }


  directionalLight(255, 69, 0, 0, -1/5, -1);

  translate(750, -100);
  rotateY(angle);

  angle=angle+PI/50;

  noFill();
  stroke(#FF8C00);
  sphereDetail(60);
  sphere(800);


  directionalLight(255, 70, 100, -1, 0, -2);

if (second() % 2 == 0) { 
    jitter = random(-2, 2);
  }
  angle2 = angle + jitter;
  float c = cos(angle2);
  pushMatrix();
  translate(-50, 700, -10);
  rotate(c);


  fill(#FF4500);
  noStroke();
  sphereDetail(70);
  sphere(100);

  popMatrix();

  saveFrame("frames01/###.png");

  }
