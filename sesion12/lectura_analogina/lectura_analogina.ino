int inputAnalog = 0;

void setup() {
 pinMode(A0, INPUT);
 pinMode(7, OUTPUT);
}

void loop() {
  inputAnalog = analogRead(A0);
  digitalWrite(7,HIGH);
  delay(inputAnalog);
  digitalWrite(7, LOW);  
}
