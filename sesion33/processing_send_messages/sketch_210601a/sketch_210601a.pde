// https://github.com/uhhernadez/pi_2021A/tree/master/sesion24/enviar
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

void keyPressed() {
  switch(key) {
    case 's':
    SendMessage("/reproductor/accion/stop",1);  
    break;
    case 'p': // play
    SendMessage("/reproductor/accion/play",1);
    break;
  
    case 'c':
    SendMessage("/reproductor/audio", 0);
    break;
  }  
  
}

void SendMessage(String path, int val) {
  OscBundle bundle = new OscBundle();
  OscMessage message = new OscMessage(path);
  message.add(val);
  bundle.add(message);
  oscP5.send(bundle, server);
}


void mousePressed() {
  OscBundle bundle = new OscBundle();
  OscMessage message = new OscMessage("/puredata/dato");
  message.add(millis());
  bundle.add(message);
  oscP5.send(bundle, server);
}
