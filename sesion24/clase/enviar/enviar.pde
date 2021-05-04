import oscP5.*;
import netP5.*;
NetAddress server;
OscP5 oscP5;
color back_color;
void setup() {
  size(400,400);
  frameRate(25);
  oscP5 = new OscP5(this,11001);
  server = new NetAddress("127.0.0.1",11000);
}

void draw() {
  background(back_color);
}

void mousePressed() {
  println("Enviar");
  back_color = color(random(0,255),random(150,180),random(78,200) );
  OscBundle bundle = new OscBundle();
  OscMessage message = new OscMessage("/datos/dato");
  message.add(random(0, 100));
  bundle.add(message);
  oscP5.send(bundle, server);
}
