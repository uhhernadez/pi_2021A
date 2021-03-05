int pinLED = 7;
int pinIn = 3;
int buttonIn = 0;

void setup() {
  pinMode(pinLED, OUTPUT);
  pinMode(pinIn, INPUT);
}

void loop() {
  buttonIn = digitalRead(pinIn);

  if(buttonIn == HIGH)
  {
    digitalWrite(pinLED, HIGH);
  }
  else
  {
    digitalWrite(pinLED, LOW);  
  }
  //delay(200);
}
