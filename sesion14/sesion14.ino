int ledpins[] = {8, 9, 10};
int pushpins[] = {7, 6, 5};
int readings[3];

void setup()
{
  Serial.begin(9600);  
  for(int k = 0; k < 3; k++) {
    pinMode(ledpins[k], OUTPUT);
    pinMode(pushpins[k], INPUT);
  }
}

void loop()
{
  for(int k = 0; k < 3; k++) {
    readings[k] = digitalRead(pushpins[k]);
  }
  
  for(int k = 0; k < 3; k++) {
    if(readings[k] == HIGH) {
      digitalWrite(ledpins[k], HIGH);
    } else {
      digitalWrite(ledpins[k], LOW);
    }
  }  
  delay(100);
}
