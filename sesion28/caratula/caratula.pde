import controlP5.*;
import oscP5.*;
import netP5.*;

ControlP5 cp5;
NetAddress server;
OscP5 oscP5;
PImage logo;

void setup() {
  size(512, 512);
  cp5 = new ControlP5(this);
  initPlayStopControl(cp5);
  oscP5 = new OscP5(this,13000);
  server = new NetAddress("127.0.0.1",13001);
  logo = loadImage("logo.png");
}

void draw() {
  background(0);
  image(logo,0, 0);
}
