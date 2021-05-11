import oscP5.*;
import netP5.*;

OscP5 osc;
float x, y;
void setup() {
  size(500, 500);
  frameRate(25);
  osc = new OscP5(this, 13000);
  x = 0;
  y = 0;
}

void draw() {
  background(125);
  rectMode(CENTER);
  rect(x, y, 20, 20);
}

void oscEvent(OscMessage msg) {
  switch(msg.addrPattern())
  {
    case "/coordinates/x": x = msg.get(0).floatValue(); break;
    case "/coordinates/y": y = msg.get(0).floatValue(); break;
    default: println(msg.addrPattern()); break;
  }
}
