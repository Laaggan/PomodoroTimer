String currentDateString = str(year()) + "-" + str(month()) + "-" + str(day());
int currentDateInt = int(str(year()) + str(month()) +str(day()));
int[] currentTime = {hour(), minute(), second()};
String currentTimeString;
boolean createNewSession = false;
Pomodoro pomodoro;
Button button;

import processing.sound.*;
SinOsc sine;

public static int study = 5;
public static int shortBreak = 5;
public static int longBreak = 10;

int buttonPositionX = 50;
int buttonPositionY = 50;
int buttonSizeX = 50;
int buttonSizeY = 100;

void setup() {
  size(500, 500);
  PFont font;
  font = createFont("OpenSans-Regular.ttf", 32);
  textFont(font);
  text(currentDateString, width/2-32*3, height/2);
  sine = new SinOsc(this);
  button = new Button(buttonPositionX, buttonPositionX, buttonSizeX, buttonSizeY);
}

void draw() {
  background(211);
  button.drawButton();
  currentTime[0] = hour();
  currentTime[1] = minute();
  currentTime[2] = second();

  currentTimeString = currentDateString + ", " + createTimeString(currentTime);
  text(currentTimeString, width/2-32*3, height/2);

  if (button.CheckButtonPressed()) {
    pomodoro = new Pomodoro(createTimeStamp(), study);
  }

  if (!(pomodoro == null) && !(pomodoro.CheckIfPassEnded(createTimeStamp()))) {
    text(createTimeString(pomodoro.deltaTime), width/2-32*3, height/2+32*2);
  }
  if (!(pomodoro == null) && pomodoro.CheckIfPassEnded(createTimeStamp())) {
    sine.play();
    delay(1000);
    sine.stop();
    pomodoro = null;
  }
}

int[] createTimeStamp() {
  int[] currentTime = {hour(), minute(), second()};
  return currentTime;
}

String createTimeString(int[] time) {
  String timeString = str(time[0]) + ":" + str(time[1]) + ":" + str(time[2]);
  return timeString;
}

/*
 import processing.sound.*;
 SinOsc sine;
 
 void setup() {
 size(640, 360);
 background(255);
 
 // Create the sine oscillator.
 sine = new SinOsc(this);
 sine.play();
 }
 
 void draw() {
 }
 */