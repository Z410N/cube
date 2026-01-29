int seed = int(random(999999));
int hiRes = 1920;
PGraphics pg;

void setup() {
  size(960, 960, P3D);
  smooth(8);
  pixelDensity(2);
  pg = createGraphics(hiRes, hiRes, P3D);
  pg.smooth(8);
  generate();
}

void draw() {
}

void keyPressed() {
  if (key == 's') saveImage();
  else {
    seed = int(random(999999));
    generate();
  }
}

void generate() {
  randomSeed(seed);
  noiseSeed(seed);

  int bg = getColor(random(10));
  float fov = PI/random(2.2, 3.0);
  float rx = random(TAU), ry = random(TAU), rz = random(TAU);

  background(bg);
  drawScene(this.g, width, height, fov, rx, ry, rz);

  randomSeed(seed);
  noiseSeed(seed);
  random(10); random(2.2, 3.0); random(TAU); random(TAU); random(TAU);

  pg.beginDraw();
  pg.background(bg);
  drawScene(pg, hiRes, hiRes, fov, rx, ry, rz);
  pg.endDraw();
}

void drawScene(PGraphics g, int w, int h, float fov, float rx, float ry, float rz) {
  float cameraZ = (h/2.0) / tan(fov/2.0);
  g.perspective(fov, float(w)/float(h), cameraZ/10.0, cameraZ*10.0);

  g.translate(w*0.5, h*0.5);
  g.rotateX(rx);
  g.rotateY(ry);
  g.rotateZ(rz);

  float size = 500 * (w / 960.0);

  g.stroke(0, 20);
  g.strokeWeight(0.5 * (w / 960.0));

  g.scale(1.2);

  for (int i = 0; i < 640; i++) {
    g.pushMatrix();
    g.rotateX((TAU/4)*int(random(8)));
    g.rotateY((TAU/4)*int(random(8)));
    g.rotateZ((TAU/4)*int(random(8)));
    g.translate(random(-size, size), random(-size, size), random(-size, size));
    float bw = random(10, 80) * (w / 960.0);
    float bh = random(10, 80) * (w / 960.0);
    float bd = random(10, 80) * (w / 960.0);
    g.fill(getColor());
    boxGrid(g, bw, bh, bd, int(random(4, 19)), int(random(4, 19)), int(random(4, 19)), 0.2 * (w / 960.0));
    g.popMatrix();
  }
  for (int i = 0; i < 640; i++) {
    g.pushMatrix();
    g.rotateX((TAU/4)*int(random(8)));
    g.rotateY((TAU/4)*int(random(8)));
    g.rotateZ((TAU/4)*int(random(8)));
    g.translate(random(-size, size), random(-size, size), random(-size, size));
    float bw = random(10, 80) * (w / 960.0);
    float bh = random(10, 80) * (w / 960.0);
    float bd = random(10, 80) * (w / 960.0);
    g.fill(getColor());
    g.box(bw*20, bh*0.02, bd*0.02);
    g.popMatrix();
  }
  for (int i = 0; i < 6400; i++) {
    g.pushMatrix();
    g.rotateX((TAU/4)*int(random(8)));
    g.rotateY((TAU/4)*int(random(8)));
    g.rotateZ((TAU/4)*int(random(8)));
    g.translate(random(-size, size), random(-size, size), random(-size, size));
    float bw = random(10, 80) * (w / 960.0);
    float bh = random(10, 80) * (w / 960.0);
    float bd = random(10, 80) * (w / 960.0);
    g.fill(getColor());
    g.box(bw*0.04, bh*0.04, bd*0.04);
    g.popMatrix();
  }
}

void boxGrid(PGraphics g, float w, float h, float d, int cw, int ch, int cd, float bb) {
  float sw = w*1./cw;
  float sh = h*1./ch;
  float sd = d*1./cd;
  float det = random(0.01);
  float des = random(1000);
  int c1 = getColor();
  int c2 = getColor();
  for (int k = 0; k < cd; k++) {
    for (int j = 0; j < ch; j++) {
      for (int i = 0; i < cw; i++) {

        if ((i+j+k)%2 == 0) g.fill(c1);
        else g.fill(c2);

        g.pushMatrix();
        float dx = -w*0.5+(i+0.5)*sw;
        float dy = -h*0.5+(j+0.5)*sh;
        float dz = -d*0.5+(k+0.5)*sd;
        g.translate(dx, dy, dz);
        g.box(sw-bb, sh-bb, sd-bb);
        g.popMatrix();
      }
    }
  }
}

void saveImage() {
  String timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  pg.save(timestamp+".png");
}

//int colors[] = {#FFFFFF, #FFC930, #F58B3F, #395942, #212129};
int colors[] = {#F4D3DE, #E04728, #F7B63D, #3F9686, #313168};
//int colors[] = {#F8F8F9, #FE3B00, #7233A6, #0601FE, #000000};
int rcol() {
  return colors[int(random(colors.length))];
}
int getColor() {
  return getColor(random(colors.length));
}
int getColor(float v) {
  v = abs(v);
  v = v%(colors.length);
  int c1 = colors[int(v%colors.length)];
  int c2 = colors[int((v+1)%colors.length)];
  return lerpColor(c1, c2, pow(v%1, 2));
}
