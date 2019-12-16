PImage img;
PImage img_noise;
PImage img_random;
PFont font;

void setup() {
  size(368, 546);

  font = createFont("VCR_OSD_MONO_1.001.ttf", 60);
  textFont(font);
  textAlign(LEFT, TOP);
 
  img = loadImage("8d2f491323_2.jpg");
  img_noise = loadImage("hatsune_1.jpg");
  img_random = loadImage("hatsune_2.jpg");
}

void draw() {
  background(0);

  float seed = random(1);

  if (seed < 0.3) {
    displayImage(img_noise);
  } else if (seed >= 0.3 && seed < 0.5) {
    displayImage(img_random);
  } else {
    displayImage(img);
  }

  loadPixels();
  for (int y = 0; y < height; y++)
  {
    for (int x = 0; x < width; x++)
    {
      int index = y * width + x;
      int pixel = pixels[index];

      float r = red(pixel);
      float g = green(pixel);
      float b = blue(pixel);

      float adjustBrightness = 7;

      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;

      r = constrain(r, 0, 255);
      g = constrain(g, 0, 200);
      b = constrain(b, 0, 255);

      pixels[index] = color(r, g, b);
    }
  }
  updatePixels();

  seed = random(1);
  if (seed < 0.5) {
    filter(BLUR, 2);
  } else {
    filter(BLUR, 1);
  }
 fill(50,400,150);; //
  text("PLAY", 0, 0);
;
  if (frameCount <= 30) {
    saveFrame("./pict/####.png");
  } else {
    exit();
  }
} 
void displayImage(PImage pict) {
  int alp = 80;

  tint(155, 0, 0, alp);
  image(pict, random(-10, 10), 0);
  tint(0, 255, 0, alp);
  image(pict, random(-10, 10), 0);
  tint(0, 0, 155, alp);
  image(pict, random(-10, 10), 0);
saveFrame("./pict/####.png");
}