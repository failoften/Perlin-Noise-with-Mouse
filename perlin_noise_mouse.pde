  float centerX, centerY, radialX, radialY, theta, rad;
  color paint;
  float shade;
  float perlinX, perlinY;

void setup() {
  size(600, 600);
  centerX = width/2;
  centerY = height/2;
  rad = 250;
  loadPixels();
}

void draw() {
  for (int i = 0; i < 100; i++) {
//   rad = 150;
   rad = random((height * .3) - cos(theta) * 5, height * .3);
//   theta = random(2*PI);
   theta += .1;  // Play with me! Default .1 .
   radialX = mouseX + sin(theta) * rad * perlinX;
   radialY = mouseY + cos(theta) * rad * perlinY;
   radialX = constrain(radialX, 0, width - 1);  // Keep pixArray in bounds.
   radialY = constrain(radialY, 0, height - 1);
//   Optional distance map. Lots of possibilities with map values.  
//   float shade = dist(centerX, centerY, radialX, radialY);
//   paint = color(int(map(shade, 0, 255, -100, 255)), 0, 0, 25);
//   noiseDetail(4, .5);
   perlinX = noise(sin(theta) * 51.5) * 1.75;  // Optional Perlin perturbation.
   perlinY = noise(cos(theta) * 51.3) * 1.75;
//   perlinX = 1; perlinY = 1;  // Use this to cancel perlin.
     
//   pixels[int(radialX) + (int(radialY) * width)] = paint;
//   updatePixels();
  
   stroke(55, 0, 200, random(75));  // Use point instead of pixels for alpha.
   stroke(paint);
   point(radialX, radialY);
  
  println(frameRate);
  }
}