
int scale = 20;

int w = 1800, h = 1000;
int cols, rows;
float[][] z;

float noise_step = 0.2;
float zoff = 0;

float angle;
float jitter;

float a = 0.0;
float rSize; 

float diameter;
//float angle = 0;


void setup() {
  size(1024, 768, P3D);
  frameRate(10);

  cols = round(w / scale);
  rows = round(h / scale);

  diameter = height - 400;

}

void draw() {

  background(20);

stroke(#4682B4);
  noFill();

  translate(width / 2, height / 2);
  rotateX(PI / 2);

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


pushMatrix();

a += 0.005;
  if(a > TWO_PI) {
    a = 0.0;
  }


pushMatrix();


if (second() % 2 == 0) { 
    jitter = random(-2, 2);
  }
  angle = angle + jitter;
  float c = sin(angle);
  translate(width/2.01, height/2.01, 0);
  rotate(c);

  noFill();
  stroke(#ADFF2F);
  sphereDetail(5);
  sphere(200);

  popMatrix();


if (second() % 2 == 0) { 
    jitter = random(-5, 5);
  }
  angle = angle /2 + jitter *5;
  float c2 = cos(angle);
  translate(width/2.05, height/2, 0);
  rotate(c2);

  noFill();
  stroke(#FF69B4);
  sphereDetail(5);
  sphere(200);

  popMatrix();


  pushMatrix();


if (second() % 2 == 0) { 
    jitter = random(-2, 2);
  }
  angle = angle + jitter;
  //float c = cos(angle);
  translate(width/2, height/2, 0);
  rotate(c2);

  noFill();
  stroke(#FF4500);
  sphereDetail(5);
  sphere(200);

  popMatrix();

pushMatrix();


if (second() % 2 == 0) { 
    jitter = random(-2, 2);
  }
  angle = angle + jitter;
  //float c = cos(angle);
  translate(width/2, height/2, 0);
  rotate(c2);

  noFill();
  stroke(#FF8C00);
  sphereDetail(5);
  sphere(200);

  popMatrix();

pushMatrix();


if (second() % 2 == 0) { 
    jitter = random(-2, 2);
  }
  angle = angle + jitter;
  //float c = sin(angle);
  translate(width/2, height/2, 0);
  rotate(c);

  noFill();
  stroke(#4682B4);
  sphereDetail(5);
  sphere(200);

  popMatrix();


pushMatrix();


directionalLight(255, 70, 100, -1, 0, -2);

if (second() % 2 == 0) { 
    jitter = random(-2, 2);
  }
  angle = angle + jitter;
  
  //float c = sin(angle);
  translate(width/2, height/2, 0);
  rotate(c);

  noStroke();
  fill(#DC143C);
  sphereDetail(6);
  sphere(130);

  popMatrix();

saveFrame("frames02/###.png");

  }
