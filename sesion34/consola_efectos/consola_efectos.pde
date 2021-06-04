// https://github.com/uhhernadez/pi_2021A/tree/master/sesion24/enviar
import oscP5.*;
import netP5.*;
NetAddress server;
OscP5 oscP5;
char keyp;
void setup() {
  size(400,400);
  frameRate(25);
  oscP5 = new OscP5(this,10000);
  server = new NetAddress("127.0.0.1",10000);
}

void draw() {
  background(0);
  textAlign(CENTER);
  textSize(128);
  text(keyp,width/2, height/2);
}

void keyPressed() {
  
  switch(key) {
    case '1':
      SendMessage("/reproductor/audio", 1);
  keyp=key;
    break;
    case '2':
      SendMessage("/reproductor/audio", 2);
    keyp=key;
    break;
    case '3':
      SendMessage("/reproductor/audio", 3);
      keyp=key;
    break;
    case '4':
      SendMessage("/reproductor/audio", 4);
      keyp=key;
    break;
    case '5':
      SendMessage("/reproductor/audio", 5);
      keyp=key;
    break;
    case '6':
      SendMessage("/reproductor/audio", 6);
      keyp=key;
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
