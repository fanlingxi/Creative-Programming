float G=10;
//设置引力常数
float earthMass=12, moonMass=1;
//设置地月质量
float earthAngle=0, moonAngle=0;
//设置地月角度
float earthLength=250, moonLength=100;
//设置地月轨道长度
import controlP5.*;
ControlP5 cp5;
void setup() {
  size(800, 800, P3D);
  noStroke();
  background(0); 
  frameRate(60);
  cp5 = new ControlP5(this);
  cp5.addSlider("earthMass")
    .setPosition(0, 50)
    .setRange(0.1, 20)
    ;  
  cp5.addSlider("moonMass")
    .setPosition(200, 50)
    .setRange(0.1, 20)
    ;  
  cp5.addSlider("earthLength")
    .setPosition(0, 150)
    .setRange(50, 400)
    ;  
  cp5.addSlider("moonLength")
    .setPosition(200, 150)
    .setRange(50, 200)
    ;
  //添加滑条组件
}
void draw() {
  push();
  fill(0, 40);
  rect(0, 0, width, height);
  lights();
  //开启灯光
  translate(width/2, height/2);

  push();
  push();
  fill(255, 70, 0);
  sphere(100);
  //绘制太阳
  pop();
  float earthX=cos(radians(earthAngle))*earthLength;
  float earthY=sin(radians(earthAngle))*earthLength;  
  //计算地球位置
  fill(3, 106, 209);  
  push();
  translate(earthX, earthY, 0);
  sphere(60);
  //绘制地球
  pop();
  float moonX=cos(radians(moonAngle))*moonLength+earthX;
  float moonY=sin(radians(moonAngle))*moonLength+earthY;
  fill(249, 190, 20);
  push();
  translate(moonX, moonY, 0);
  sphere(20);
  //绘制月球
  pop();
  pop();
  earthAngle+=G/earthMass;
  //计算地球的旋转
  moonAngle+=G/moonMass;
  //计算月球的旋转
  pop();
}
