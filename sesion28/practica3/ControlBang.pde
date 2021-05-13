import controlP5.*;

class ControlBang {
  ControlP5 cp5;
  CallbackListener cl;

  ControlBang(PApplet papp) {
    cp5 = new ControlP5(papp);
    cp5.addBang("bang")
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
    
    cp5.addCallback(cl);
  }
}
