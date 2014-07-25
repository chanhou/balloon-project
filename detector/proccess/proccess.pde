/*
 * ReceiveMultipleFieldsBinaryToFile_P
 *
 * portIndex must be set to the port connected to the Arduino
 * based on ReceiveMultipleFieldsBinary, this version saves data to file
 * Press any key to stop logging and save file
 */

import processing.serial.*;


PrintWriter output;
String fileName;
int i=0;
Serial myPort;        // Create object from Serial class
short portIndex = 0;  // select the com port, 0 is the first port

void setup()
{
  size(200, 200);
  // Open whatever serial port is connected to Arduino.
  String portName = Serial.list()[portIndex];
  println(Serial.list());
  println(" Connecting to -> " + Serial.list()[portIndex]);
  myPort = new Serial(this, portName, 9600);
  
  output = createWriter("data.txt"); // save the file in the sketch folder
}

void draw()
{
  int val;
  String time;

  if ( myPort.available() >= 3)  // wait for the entire message to arrive
  {
    String value = myPort.readString();
    println(value);
    if(value != null){
       i+=1;   
      String timeString = hour()+":"+minute()+":"+second()+":"+millis();
      println(i+",Message received at " + timeString);
      output.println(i+",Message received at " + timeString);
      output.flush();
    }
  }
}

