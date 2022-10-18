int num = 400;
Agent[] as;
PImage pic;


void setup() {
  size(675, 900);
  colorMode(HSB);
  as = new Agent[num];
  for (int i = 0; i < num; i++) {
    as[i] = new Agent();
  }

  pic = loadImage("2.jpeg");
  pic.resize(width, height);
  //pic.filter(THRESHOLD, 0.6);

  background(255);
  //image(pic, 0, 0);
}

void draw() {
  for (int i = 0; i < num; i++) {
    as[i].update();
    as[i].display();
  }
  //saveFrame(); 
  //image(pic, 0, 0);
  //float thres = map(mouseX, 0, width, 0, 1);
  //filter(THRESHOLD, thres);
  //textSize(48);
  //text(thres, mouseX, mouseY);
}


class Agent {
  PVector center;
  PVector spd;
  PVector loc;
  float angle = random(TWO_PI);
  PVector prev;
  float angleSpd = random(0.01, 0.05);
  float rad = random(10, 100);
  color c = color(random(150,200), random(150, 200), random(150, 200));

  Agent() {
    center = new PVector(random(width), random(height));
    spd = PVector.random2D();
    spd.mult(2);

    loc = new PVector();
    loc.set(center.x+cos(angle)*rad, center.y+sin(angle)*rad);
    prev = loc.copy();
  }

  void update() {
    center.add(spd);

    angle += angleSpd;
    loc.set(center.x+cos(angle)*rad, center.y+sin(angle)*rad);

    if (loc.x <0 || loc.x > width || loc.y < 0 || loc.y > height) {
      center.set(random(width), random(height));
      loc.set(center.x+cos(angle)*rad, center.y+sin(angle)*rad);
      prev = loc.copy();
    }
  }
  void display() {
    if (brightness(pic.get(int(loc.x), int(loc.y))) == 255) {
      strokeWeight(1);
      stroke(200);
      point(loc.x, loc.y);
    } else {
      strokeWeight(1);
      stroke(c, 100);
      line(prev.x, prev.y, loc.x, loc.y);
    }
    prev = loc.copy();
  }
}
