// Practica 2: Solución
int pinPB1 = 2;
int pinPB2 = 4;
int pinsLED[] = {8, 9, 10, 11, 12, 13};
int leds[6] = {LOW, LOW, LOW, LOW, LOW, LOW};
int n = 0;
int secuencia = 0;
int seleccion = 0;

void setup() {
  pinMode(pinPB1, INPUT);
  pinMode(pinPB2, INPUT);
  Serial.begin(9600);
  
  for(int i; i < 6; i++) {
    pinMode(pinsLED[i], OUTPUT);
  }
}

void loop() {
  int potenciometro = abs(analogRead(A0)); // [0, 1023]
  int ret = map(potenciometro, 0, 1023, 0, 500);
  int detener = digitalRead(pinPB1);
  int cambiar = digitalRead(pinPB2);
  //Serial.println(cambiar);
  //Serial.println(seleccion);
  
  if(cambiar == HIGH) {
    seleccion ++;
    seleccion = seleccion % 3;
  }
  
  if(detener != HIGH) {
    Serial.println("Seleccion");
    switch(seleccion) {
      case 0: secuencia1(); break;
      case 1: secuencia2(); break;
      case 2: secuencia3(); break;
    } 
  }
  
  for(int i=0; i < 6; i++) {
    digitalWrite(pinsLED[i], leds[i]);
  }
  delay(ret);
}

void resetLEDS() {
  for(int i=0; i < 6; i++) {
    leds[i] = LOW;
  }
}

void secuencia1(){
  resetLEDS();
  n = n % 10;
  switch(n) {
    case 0: leds[0] = HIGH; break;
    case 1: leds[1] = HIGH; break;
    case 2: leds[2] = HIGH; break;
    case 3: leds[3] = HIGH; break;
    case 4: leds[4] = HIGH; break;
    case 5: leds[5] = HIGH; break;
    case 6: leds[4] = HIGH; break;
    case 7: leds[3] = HIGH; break;
    case 8: leds[2] = HIGH; break;
    case 9: leds[1] = HIGH; break;
  } 
  n++;
}

void secuencia2(){
  resetLEDS();
  n = n % 8;
  switch(n) {
    case 0: leds[0] = HIGH; leds[1] = HIGH; break;
    case 1: leds[1] = HIGH; leds[2] = HIGH;  break;
    case 2: leds[2] = HIGH; leds[3] = HIGH;  break;
    case 3: leds[3] = HIGH; leds[4] = HIGH;  break;
    case 4: leds[4] = HIGH; leds[5] = HIGH;  break;
  case 5: leds[3] = HIGH; leds[4] = HIGH;  break;
    case 6: leds[2] = HIGH; leds[3] = HIGH;  break;
    case 7: leds[1] = HIGH; leds[2] = HIGH;  break;
  } 
  n++;
}

void secuencia3(){
resetLEDS();
  n = n % 2;
  switch(n) {
    case 0: leds[0] = HIGH; leds[1] = HIGH; leds[2] = HIGH; break;
    case 1: leds[3] = HIGH; leds[4] = HIGH; leds[5] = HIGH;  break;
  } 
  n++;
}
