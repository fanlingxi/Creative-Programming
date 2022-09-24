int x = 400;
int y = 0;
int m = 200;
int n = 200;


void setup(){
  size(400, 400);//设置窗口大小
  frameRate(20);
}

void draw(){
  for(int i = 0; i < 1; i ++){
    line(x, 0, x, 400); //垂直线条
    line(0, y+200, 400, y+200); //画布下半部分的水平线
    line(200, y, 400, y); //右上部分的水平线
    line(x, 200, m, 400);
    line(400, n+10, n+10, 400); //下部分的右对角线
    line(n, 200, 400, 200+m);
    line(200, n+10, m+190, 400);
    x = x - 10;
    y = y + 10;
    m = m - 10;
    n = n + 10;
  saveFrame();
  }
}
