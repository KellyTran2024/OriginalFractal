void setup() {
  size(500, 500);
  noStroke();
}

void draw() {
  background(63,0,0);
  myFractal(width / 2, height / 2, 120, 8); 
  pistil(width / 2, height / 2, 12, 3, 6); 
}


void myFractal(float x, float y, float size, int numCircles) {
  if (size < 8) return; 

  fill(200, 0, 0, 100);
  for (int i = 0; i < numCircles; i++) {
    float angle = TWO_PI / numCircles * i;
    ellipse(x + cos(angle) * size * 0.7, y + sin(angle) * size * 0.7, size, size);
  }

  myFractal(x, y, size * 0.75, numCircles);
}

void pistil(float x, float y, float size, int depth, int numTriangles) {
  if (depth <= 0 || size < 3) return;

  fill(255, 204, 0, 180);
  for (int i = 0; i < numTriangles; i++) {
    float angle = TWO_PI / numTriangles * i;
    float xOffset = cos(angle) * size * 0.8;
    float yOffset = sin(angle) * size * 0.8;
    float h = size * sqrt(3) / 2;

    triangle(x + xOffset, y + yOffset - h / 2,
             x + xOffset - size / 2, y + yOffset + h / 2,
             x + xOffset + size / 2, y + yOffset + h / 2);

    pistil(x + xOffset, y + yOffset, size * 0.6, depth - 1, numTriangles);
  }
}
