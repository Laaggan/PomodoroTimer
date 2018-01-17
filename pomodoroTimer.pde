String currentDateString = str(year()) + "-" + str(month()) + "-" + str(day());
int currentDateInt = int(str(year()) + str(month()) +str(day()));
String currentTimeString;
boolean createNewSession = false;
Pomodoro pomodoro;
Button button;

import processing.sound.*;
SinOsc sine;

public static int[] study = {0,1,5};
public static int[] shortBreak = {0,5,0};
public static int[] longBreak = {0,10,0};

int pomodoroButtonX = 50;
int pomodoroButtonY = 400;
int buttonSizeX = 170;
int buttonSizeY = 50;

void setup() {
  size(500, 500);
  PFont font;
  font = createFont("OpenSans-Regular.ttf", 32);
  textFont(font);
  text(currentDateString, width/2-32*3, height/2);
  sine = new SinOsc(this);
  button = new Button(pomodoroButtonX, pomodoroButtonY, buttonSizeX, buttonSizeY, "Pomodoro");
}

void draw() {
  background(211);
  button.drawButton();

  currentTimeString = currentDateString + ", " + createTimeString(createTimeStamp());
  text(currentTimeString, width/2-32*3, height/2);

  //Check if a new session is started
  if (mousePressed == true) {
    if (button.CheckButtonPressed()) {
      pomodoro = new Pomodoro(createTimeStamp(), study);
    }
  }

  //If there exists a pomodoro and the pass has not ended
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

String createTimeString(int[] time) {
  String timeString = str(time[0]) + ":" + str(time[1]) + ":" + str(time[2]);
  return timeString;
}

//This function returns an array of integers {currentHour, currentMinute, currentSeconds}
int[] createTimeStamp() {
  int[] currentTime = {hour(), minute(), second()};
  return currentTime;
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