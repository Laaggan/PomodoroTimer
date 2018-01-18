String currentDateString = str(year()) + "-" + str(month()) + "-" + str(day());
int currentDateInt = int(str(year()) + str(month()) +str(day()));
String currentTimeString;
boolean createNewSession = false;
Pomodoro pomodoro;
Button pomodoroButton, shortButton, longButton;
import processing.sound.*;
SinOsc sine;

//The public part is right now redundant due to I still pass it as a argument to the Pomodoro class
public static int[] study = {0, 25, 0};
public static int[] shortBreak = {0, 5, 0};
public static int[] longBreak = {0, 10, 0};

int buttonSizeX = 170;
int buttonSizeY = 50;

int pomodoroButtonX = 20;
int pomodoroButtonY = 200;

int shortButtonX = buttonSizeX + pomodoroButtonX + 10;
int shortButtonY = 200;

int longButtonX = shortButtonX + buttonSizeX + 10;
int longButtonY = 200;

void setup() {
  size(600, 300);
  PFont font;
  font = createFont("OpenSans-Regular.ttf", 32);
  textFont(font);
  text(currentDateString, width/2-32*3, height/2);
  sine = new SinOsc(this);

  pomodoroButton = new Button(pomodoroButtonX, pomodoroButtonY, buttonSizeX, buttonSizeY, "Pomodoro");
  shortButton = new Button(shortButtonX, shortButtonY, buttonSizeX, buttonSizeY, "Short break");
  longButton = new Button(longButtonX, longButtonY, buttonSizeX, buttonSizeY, "Long break");
}

void draw() {
  background(211);
  pomodoroButton.drawButton();
  shortButton.drawButton();
  longButton.drawButton();
  currentTimeString = currentDateString + ", " + createTimeString(createTimeStamp());
  text(currentTimeString, 50, 50);

  //Check if a new session is started
  if (mousePressed == true) {
    if (pomodoroButton.CheckButtonPressed()) {
      pomodoro = new Pomodoro(createTimeStamp(), study);
    }
    if (shortButton.CheckButtonPressed()) {
      pomodoro = new Pomodoro(createTimeStamp(), shortBreak);
    }
    if (longButton.CheckButtonPressed()) {
      pomodoro = new Pomodoro(createTimeStamp(), longBreak);
    }
  }

  //If there exists a pomodoro and the pass has not ended update the text with the remaining time of the timer
  if (!(pomodoro == null) && !(pomodoro.CheckIfPassEnded(createTimeStamp()))) {
    text(createTimeString(pomodoro.deltaTime), 50, 100);
  }
  //If there exists a pomodoro and the has ended then play a tone and set the pomodoro to null and wait for the next pass
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