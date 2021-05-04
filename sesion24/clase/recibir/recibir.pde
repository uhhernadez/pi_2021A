import oscP5.*;
import netP5.*;
OscP5 osc;
int num = 0;
void setup() {
  size(512, 512);
  frameRate(25);
  osc = new OscP5(this, 11000);
}

void draw() {
  background(0);
  textSize(128);
  textAlign(CENTER);
  text(num, width/2, height/2);
}

void oscEvent(OscMessage osc_msg) {
  //println(osc_msg);
  println("Tipo de mensaje " + osc_msg.typetag());
  println("Ruta " + osc_msg.addrPattern());
  switch(osc_msg.addrPattern()) {
    case "/datos/dato":
      switch(osc_msg.typetag()) {
        case "f": num = round(osc_msg.get(0).floatValue()); break;
        case "i": num = osc_msg.get(0).intValue(); break;
      }
    break;
    default: println("Esa ruta no existe"); break;
  }
}
