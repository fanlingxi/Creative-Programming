int bgWidth = 500;
int bgHeight = 500;
float lineSize = 0;
float colSize = 0;

color[] colors = {#ffffff, #ff0000, #ffff00, #0000ff, #000000};

void setup() {
  size(500,500);
  background(#ffffff); 
  frameRate(1);
}

void draw() {
      for(int line = 0; line < bgHeight; line += lineSize + 3) {
        lineSize = random(50, bgWidth/3);
        for(int col = 0; col < bgWidth; col += colSize + 3) {
          colSize = random(40, bgHeight/2);
//绘画格子
        color rectColor = colors[int(random(colors.length))];
        fill(rectColor);
        rect(col, line, colSize, lineSize);

// 绘制分割线
        strokeWeight(3);
        stroke(#a9a9a9);
        float x = col+colSize;
        float y = line+lineSize;
        line(0, y, bgWidth, y);
        line(x, line, x, y);
    }
    saveFrame(); 
  }
}
