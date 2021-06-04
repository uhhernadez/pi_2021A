import oscP5.*;
import netP5.*;
OscP5 oscP5; // Cliente de OSC
float potenciometro;
void setup() {
  size(400,400);
  frameRate(25);
  oscP5 = new OscP5(this, 13000);
}

void draw() {
  background(255*potenciometro);
  textAlign(CENTER);
  textSize(128);
  text(potenciometro,width/2, height/2);
}

void oscEvent(OscMessage osc_message) {
  println("### Ruta "+osc_message.addrPattern()+" Tipo "+osc_message.typetag());
  println(osc_message.get(0).floatValue());
  potenciometro = osc_message.get(0).floatValue();
}
