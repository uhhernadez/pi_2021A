class ControlSlider {
  ControlP5 control;
  CallbackListener cl;
  int sliderTicks;

  ControlSlider(ControlP5 cp5) {
    control = cp5;
    control.addSlider("sliderTicks")
       .setPosition(200,140)
       .setSize(20,100)
       .setRange(0,255)
       .setNumberOfTickMarks(5)
       ;

    cl = new CallbackListener() {
      public void controlEvent(CallbackEvent event) {
        if(event.getAction() == ControlP5.ACTION_BROADCAST){
          println("Slider value "+ str(control.getValue("sliderTicks")));
          
        }
      }
    };
    
    control.addCallback(cl);
  }
}
