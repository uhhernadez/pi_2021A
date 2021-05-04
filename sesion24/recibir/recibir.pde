import oscP5.*;
import netP5.*;
OscP5 oscP5; // Cliente de OSC

void setup() {
  size(400,400);
  frameRate(25);
  oscP5 = new OscP5(this, 10000);
}

void draw() {
  background(0);
}

void oscEvent(OscMessage osc_message) {
  println("### Ruta "+osc_message.addrPattern()+" Tipo "+osc_message.typetag());
  println(osc_message.get(0).intValue());
}
