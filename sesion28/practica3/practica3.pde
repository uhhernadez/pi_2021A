ControlP5 main_control;
ControlBang cb;
ControlSlider cs;
void setup() {
  size(512, 512);
  main_control = new ControlP5(this);
  cb = new ControlBang(main_control);
  cs = new ControlSlider(main_control);
}

void draw() {

}
