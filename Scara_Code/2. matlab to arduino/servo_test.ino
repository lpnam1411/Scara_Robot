
#include<Servo.h>
#include<string.h>
Servo myservo;
String message;
int value;

int servoPin = 9;
void setup() {
  // put your setup code here, to run once:
myservo.attach(servoPin);
Serial.begin(9600);
pinMode(13,OUTPUT);
//Serial.write("a");
}

void loop() {
  if(Serial.available()>0){
    value = Serial.read();
    
    Serial.print(value);
    myservo.write(value);
    //value = value - 48;
    //if(value == 1){
      //digitalWrite(13,1);
     // Serial.print(value);
    //}
    //if(value == 2){
      //digitalWrite(13,0);
      //Serial.print(value);
    //}
    //myservo.write(value);
    // if (value == 30){
    //   myservo.write(value);
    // }
    // if(value == 90){
    //   myservo.write(value);
    // }
    // if(value == 60){
    //   myservo.write(value);
    // }
    // if(value == 150){
    //   myservo.write(value);
    // }
   


    
    //myservo.write()
  }
  // put your main code here, to run repeatedly:
//myservo.write(180);
//delay(500);
//myservo.write(90);
// delay(500);
// myservo.write(180);
// delay(500);
}
