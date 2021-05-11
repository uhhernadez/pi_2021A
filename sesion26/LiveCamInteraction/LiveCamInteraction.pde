import gab.opencv.*;
import processing.video.*;
import java.awt.*;
import oscP5.*;
import netP5.*;

OscP5 osc;
NetAddress server;
float x, y;

Capture video;
OpenCV opencv;

void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  video.start();
  osc = new OscP5(this, 13000);
  server = new NetAddress("127.0.0.1", 13001);
}

void draw() {
  scale(2);
  opencv.loadImage(video);

  image(video, 0, 0 );

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    if(i == 0) {
      float dx = faces[0].x - x;
      float dy = faces[0].y - y;
      
      if(abs(dx) > 10) {
        if(dx > 0) {
          sendMessage(440);
        } else {
          sendMessage(880);
        }
      }
      x = faces[0].x;
      y = faces[0].y;
    }
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}

void captureEvent(Capture c) {
  c.read();
}

void sendMessage(int n) {
  OscBundle bundle = new OscBundle();
  OscMessage msg = new OscMessage("/puredata/freq");
  msg.add(n);
  bundle.add(msg);
  osc.send(bundle, server);
}
