import oscP5.*;
import netP5.*;
OscP5 oscP5; // Cliente de OSC
float [] frecuencias;
void setup() {
  size(640, 480);
  frameRate(25);
  oscP5 = new OscP5(this, 10000);
  frecuencias = new float[32];
}

void draw() {
  background(0);
  float ancho = 20;
  for(int k =0; k < frecuencias.length; k++) {
    rect(k*ancho, height,ancho, -480*frecuencias[k]);
  }
}

void oscEvent(OscMessage osc_message) {
  //println("### Ruta "+osc_message.addrPattern()+" Tipo "+osc_message.typetag());
  //print(osc_message.get(0).intValue());
  //println(" "+ forzarFlotante(osc_message.get(1)));
  int ind = osc_message.get(0).intValue();
  float valor = forzarFlotante(osc_message.get(1));
  frecuencias[ind] = valor;
}

float forzarFlotante(OscArgument msg) {
  try {
    float aux = msg.floatValue();
    return aux;
  } catch(Exception e) {
    return (float)msg.intValue();      
  }  
}
