import controlP5.*;
class ControlBang {
  ControlP5 control;
  CallbackListener cl;

  ControlBang(ControlP5 cp5) {
    control = cp5;
    control.addBang("bang")
      .setPosition(120, 200)
      .setSize(40, 40)
      .setId(0)
      ;

    cl = new CallbackListener() {
      public void controlEvent(CallbackEvent event) {
        if(event.getAction() == ControlP5.ACTION_PRESSED){
          println("Click: "+ str(millis()));
        }
      }
    };
    
    control.addCallback(cl);
  }
}
