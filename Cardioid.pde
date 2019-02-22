int total = 200;
float r; 
float factor = 2;
//float col1 = random(0, 255);
//float col2 = random(0, 255);
//float col3 = random(0, 255);

int state = 0;
int art = 255;
int red = 255;
int green = 0;
int blue = 0;

void setup() {
  size(640, 640);
  r = width / 2 - 16;
}



PVector getVector1(float index, float total) {
  float angle = map(index % total, 0, total, 0, TWO_PI);
  PVector v = PVector.fromAngle(angle + PI);
  v.mult(r);
  return v;
}

PVector getVector2(float index, float total) {
  float angle = map(index % total, 0, total, 0, TWO_PI);
  PVector v = PVector.fromAngle(angle);
  v.mult(r);
  return v;
}

void draw() {
  background(0);
  int total = 850;//int(map(mouseX, 0, width, 0, 200));
  //factor += 0.01;
  translate(width/2, height/2);
  stroke(255);
  noFill();
  circle(0, 0, r*2);



  for (int i = 0; i < total; i++) {
    PVector v = getVector1(i, total);
    fill(255);
    circle(v.x, v.y, 16);
  }

  for (int i = 0; i < total; i++) {
    PVector a = getVector1(i, total);
    PVector b = getVector1(i * factor, total);

    //if(col1 >= 255) col1 = random(0, 255);
    //if(col2 >= 255) col2 = random(0, 255);
    //if(col3 >= 255) col3 = random(0, 255);

    //col1++;
    //col2++;
    //col3++;

    if (state == 0) {
      green++;
      if (green == 255)
        state = 1;
    }
    if (state == 1) {
      red--;
      if (red == 0)
        state = 2;
    }
    if (state == 2) {
      blue++;
      if (blue == 255)
        state = 3;
    }
    if (state == 3) {
      green--;
      if (green == 0)
        state = 4;
    }
    if (state == 4) {
      red++;
      if (red == 255)
        state = 5;
    }
    if (state == 5) {
      blue--;
      if (blue == 0)
        state = 0;
    }
    //int hex = (art << 24) + (red << 16) + (green << 8) + (b);

    stroke(red, blue, green);
    line(a.x, a.y, b.x, b.y);
  }

  //factor = 1.5;
  r = r/1.7;
  stroke(255);
  fill(0);
  //circle(0, 0, r);

  for (int i = 0; i < total; i++) {
    PVector v = getVector2(i, total);
    //fill(255);
    //circle(v.x +100, v.y, 16);
  }

  for (int i = 0; i < total; i++) {
    PVector a = getVector2(i, total);
    PVector b = getVector2(i * factor, total);

    //if(col1 >= 255) col1 = random(0, 255);
    //if(col2 >= 255) col2 = random(0, 255);
    //if(col3 >= 255) col3 = random(0, 255);

    //col1++;
    //col2++;
    //col3++;

    if (state == 0) {
      green++;
      if (green == 255)
        state = 1;
    }
    if (state == 1) {
      red--;
      if (red == 0)
        state = 2;
    }
    if (state == 2) {
      blue++;
      if (blue == 255)
        state = 3;
    }
    if (state == 3) {
      green--;
      if (green == 0)
        state = 4;
    }
    if (state == 4) {
      red++;
      if (red == 255)
        state = 5;
    }
    if (state == 5) {
      blue--;
      if (blue == 0)
        state = 0;
    }
    //int hex = (art << 24) + (red << 16) + (green << 8) + (b);

    stroke(red, blue, green);
    line(a.x, a.y, b.x, b.y );
  }

  noLoop();
}
