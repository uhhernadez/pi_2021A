import oscP5.*;
import netP5.*;

OscP5 osc;
NetAddress server;
float x, y;
float delta;
void setup() {
  size(500, 500);
  frameRate(25);
  x = random(0,width);
  y = random(0, height);
  delta = 10;
  
  osc = new OscP5(this, 13000);
  server = new NetAddress("127.0.0.1", 13001);
}

void draw() {
  background(0);
  rectMode(CENTER);
  rect(x, y, 100, 100);
}

void oscEvent(OscMessage msg) {
  switch(msg.addrPattern())
  {
    case "/coordinates/up":    y -= delta; sendMessage(440); break;
    case "/coordinates/left":  x -= delta; sendMessage(880); break;
    case "/coordinates/right": x += delta; sendMessage(1760); break;
    case "/coordinates/down":  y += delta; sendMessage(2000); break;
    default: println(msg.addrPattern()); break;
  }
}

void sendMessage(int n) {
  OscBundle bundle = new OscBundle();
  OscMessage msg = new OscMessage("/puredata/freq");
  msg.add(n);
  bundle.add(msg);
  osc.send(bundle, server);
}
