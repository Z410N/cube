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
  pickPalette();

  int bg = getColor(random(10));
  float fov = PI/random(2.2, 3.0);
  float rx = random(TAU), ry = random(TAU), rz = random(TAU);

  background(bg);
  drawScene(this.g, width, height, fov, rx, ry, rz);

  randomSeed(seed);
  noiseSeed(seed);
  random(palettes.length);
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

int[][] palettes = {
  {#F4D3DE, #E04728, #F7B63D, #3F9686, #313168}, // og
  {#2b2b2b, #e5e5e5, #fca311, #14213d}, // Anglican
  {#2d3142, #bfc0c0, #ffffff, #ef8354, #4f5d75}, // Baikal
  {#000000, #ffffff}, // Black & White
  {#1c7c54, #73e2a7, #def4c6, #1b512d, #b6e2d3}, // Buy me a shrubbery
  {#e3ddcf, #6c6b61, #e8472e, #2d3637, #c6b5b5}, // CC239
  {#4c5b5c, #ff715b, #f9cb40, #bced09, #2f52e0}, // CC242
  {#011627, #fdfffc, #2ec4b6, #e71d36, #ff9f1c}, // Cliffs
  {#3d5a80, #98c1d9, #e0fbfc, #ee6c4d, #293241}, // Cold
  {#e2e2e2, #c9c9c9, #919191, #5e5e5e, #2b2b2b}, // Cube
  {#3b3628, #c39a8e, #e6c9c6, #674843, #394a59}, // Ducci J
  {#403337, #d9b8a8, #a6897e, #734c3e, #261c1a}, // Ducci Q
  {#f2f2f2, #d9d9d9, #bfbfbf, #a6a6a6, #8c8c8c}, // Ducci U
  {#d9d9d9, #bfbfbf, #a6a6a6, #8c8c8c, #737373}, // Ducci V
  {#dd614a, #f5af29, #f5f5f5, #73a580, #1a535c}, // Ducci X
  {#00ffff, #ff00ff, #ffff00, #000000}, // Electric
  {#222222, #333333, #444444, #555555}, // Four
  {#eeeeee, #cccccc, #aaaaaa, #888888, #666666, #444444, #222222}, // Grey
  {#1a535c, #4ecdc4, #f7fff7, #ff6b6b, #ffe66d}, // Highur
  {#e7e6e1, #f7f6e7, #d8c8b8, #b8a898, #988878}, // Jung
  {#3b3b3b, #e5e5e5, #fca311, #14213d}, // Levin
  {#e63946, #f1faee, #a8dadc, #457b9d, #1d3557}, // Meta
  {#000000, #111111, #222222, #333333, #444444}, // Mono
  {#0b090a, #161a1d, #660708, #a4161a, #ba181b, #e5383b, #b1a7a6, #d3d3d3, #f5f3f4, #ffffff}, // Neco
  {#000000, #14213d, #fca311, #e5e5e5, #ffffff}, // Night
  {#fdfffc, #2ec4b6, #e71d36, #ff9f1c, #011627}, // Ouch
  {#2e294e, #541388, #f1e9da, #ffd400, #d90368}, // Paddle
  {#f2d7ee, #d3bcc0, #a5668b, #69306d, #0e103d}, // Palettes
  {#f94144, #f3722c, #f8961e, #f9844a, #f9c74f, #90be6d, #43aa8b, #4d908e, #577590, #277da1}, // Pencils
  {#f08080, #f4978e, #f8ad9d, #fbc4ab, #ffdab9}, // Pigs
  {#ffcdb2, #ffb4a2, #e5989b, #b5838d, #6d6875}, // Pink
  {#e63946, #f1faee, #a8dadc, #457b9d, #1d3557}, // Pxtn
  {#001219, #005f73, #0a9396, #94d2bd, #e9d8a6, #ee9b00, #ca6702, #bb3e03, #ae2012, #9b2226}, // Rbn
  {#a4161a, #ba181b, #e5383b, #b1a7a6, #d3d3d3}, // Red
  {#264653, #2a9d8f, #e9c46a, #f4a261, #e76f51}, // Retro
  {#2b2d42, #8d99ae, #edf2f4, #ef233c, #d90429}, // Rubber
  {#2a9d8f, #e9c46a, #f4a261, #e76f51, #264653}, // Serpentine
  {#495057, #343a40, #212529, #adb5bd, #ced4da}, // Slate
  {#5f6c7b, #fffffe, #3d405b, #e07a5f, #81b29a}, // Tiong Bahru
  {#5f6c7b, #fffffe, #3d405b, #e07a5f, #81b29a}, // Tundra
  {#540d6e, #ee4266, #ffd23f, #3bceac, #0ead69}, // Warp
  {#264653, #2a9d8f, #e9c46a, #f4a261, #e76f51}, // Waves
  {#ffffff, #000000} // Wb
};

int[] colors;

void pickPalette() {
  int idx = int(random(palettes.length));
  colors = palettes[idx];
}

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
