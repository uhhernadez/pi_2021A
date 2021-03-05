int port = 7;

void setup() {
  pinMode(port, OUTPUT);
}

void loop() {
  // Manda un 1 digital en el puerto defino
  digitalWrite(port,HIGH);
  delay(500);
  digitalWrite(port,LOW);
  delay(500);
}
