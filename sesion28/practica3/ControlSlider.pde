class ControlSlider {
  ControlP5 cp5;
  CallbackListener cl;

  ControlSlider(PApplet papp) {
    cp5 = new ControlP5(papp);
    cp5.addSlider("sliderTicks1")
       .setPosition(200,140)
       .setSize(20,100)
       .setRange(0,255)
       .setNumberOfTickMarks(5)
       ;

    cl = new CallbackListener() {
      public void controlEvent(CallbackEvent event) {
        if(event.getAction() == ControlP5.ACTION_BROADCAST){
          println("Slider value "+ str(millis()));
          
        }
      }
    };
    
    cp5.addCallback(cl);
  }
}
