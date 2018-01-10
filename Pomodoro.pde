class Pomodoro {
  int[] deltaTime = new int[3];
  int[] stopTime;
  SinOsc sine;
  Pomodoro(int[] startTime, int typeOfTime) {
    stopTime = startTime;
    //stopTime[1] = startTime[1] + typeOfTime;
    stopTime[2] = startTime[2] + typeOfTime;
  }

  boolean CheckIfPassEnded(int[] currentTime) {
    for (int i = 0; i < stopTime.length; i++) {
      deltaTime[i] = stopTime[i] - currentTime[i];
    }
    deltaTime = ClockLogic(deltaTime);

    if (deltaTime[1] <= 0) {
      if (deltaTime[2] <= 0) {
        return true;
      }
    }
    return false;
  }

  int[] ClockLogic(int[] time) {
    if (time[2] > 60) {
      time[2] = 0;
      time[1] = time[1] + 1;
    }
    if (time[1] >= 60) {
      time[1] = 0;
      time[0] = time[1] + 1;
    }
    return time;
  }
}

/*
//Code for making sounds with processing
 
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