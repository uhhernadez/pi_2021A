boolean play_stop;

void initPlayStopControl(ControlP5 c) {
  c.addToggle("togglePlayStop")
    .setPosition(10, 200)
    .setSize(50, 20)
    .setValue(false)
    .setMode(ControlP5.SWITCH)
    .setCaptionLabel("Play/Stop");
  ;
  // add a vertical slider
  c.addSlider("sliderPitch")
    .setPosition(10, 240)
    .setSize(200, 20)
    .setRange(-1, 1)
    .setValue(1.0)
    .setCaptionLabel("Pitch");
    ;
    
 // add a vertical slider
  cp5.addSlider("sliderVolume")
     .setPosition(400,20)
     .setSize(20,200)
     .setRange(0,1)
     .setValue(1)
     .setCaptionLabel("Master");
     ; 
    
}

void togglePlayStop(boolean flag) {
  OscBundle bundle = new OscBundle();
  OscMessage message = new OscMessage("/puredata/play");
  message.add(flag);
  bundle.add(message);
  oscP5.send(bundle, server);

  if (flag==true) {
    println("Play");
  } else {
    println("Stop");
  }
}

void sliderPitch(float value) {
  OscBundle bundle = new OscBundle();
  OscMessage message = new OscMessage("/puredata/pitch");
  message.add(value);
  bundle.add(message);
  oscP5.send(bundle, server);
  println(value);
}

void sliderVolume(float value) {
  OscBundle bundle = new OscBundle();
  OscMessage message = new OscMessage("/puredata/volume");
  message.add(value);
  bundle.add(message);
  oscP5.send(bundle, server);
  println(value);

}
