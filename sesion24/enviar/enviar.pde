import oscP5.*;
import netP5.*;
NetAddress server;
OscP5 oscP5;
void setup() {
  size(400,400);
  frameRate(25);
  oscP5 = new OscP5(this,10000);
  server = new NetAddress("127.0.0.1",10000);
}

void draw() {
  background(0);
}

void mousePressed() {
  OscBundle bundle = new OscBundle();
  OscMessage message = new OscMessage("/puredata/dato");
  message.add(millis());
  bundle.add(message);
  oscP5.send(bundle, server);
}
