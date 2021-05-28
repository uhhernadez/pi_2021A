import oscP5.*;
import netP5.*;
OscP5 oscP5; // Cliente de OSC

float [] fft;

void setup() {
  size(320,400);
  frameRate(25);
  oscP5 = new OscP5(this, 10000);
  fft = new float[32];
}

void draw() {
  background(0);
  
  for(int k=0; k < fft.length; k++) {
    rect(k*10, height/2,10, -abs(fft[k])*200);
  }
}

void oscEvent(OscMessage osc_message) {
  //println("### Ruta "+osc_message.addrPattern()+" Tipo "+osc_message.typetag().length());
  //println(osc_message.get(0).intValue());
  //println(osc_message.get(1).floatValue());
  //println(forceConvertion(osc_message.get(1)));
  int i = osc_message.get(0).intValue();
  float aux = forceConvertion(osc_message.get(1));
  fft[i] = aux;
}

float forceConvertion(OscArgument arg) {
  try {
    float aux = arg.floatValue();
    return aux;
  } catch (Exception e){
    return (float) arg.intValue();
  }
}
