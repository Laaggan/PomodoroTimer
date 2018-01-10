//This class is created to perform clocklogic
class Pomodoro {
  int[] deltaTime = new int[3];
  int[] stopTime;
  SinOsc sine;
  Pomodoro(int[] startTime, int typeOfTime) {
    //Start time is the current time given as an array with {hours, minutes, seconds}
    //So stop time is first set to the start time and then the amount of time in the pass is added 
    stopTime = startTime;
    stopTime[1] = startTime[1] + 1;
    stopTime[2] = startTime[2] + typeOfTime;
    stopTime = ClockLogic(stopTime);
  }


  boolean CheckIfPassEnded(int[] currentTime) {
    for (int i = 0; i < stopTime.length; i++) {
      deltaTime[i] = stopTime[i] - currentTime[i];
    }
    
    ClockLogic(deltaTime);
    if (deltaTime[0] <= 0) {
      if (deltaTime[1] <= 0) {
        if (deltaTime[2] <= 0) {
          return true;
        }
      }
    }
    return false;
  }

  //Clock logic to transform for example {1, 61, 61} becomes {2, 2, 1} ({hours, minutes, seconds})
  int[] ClockLogic(int[] time) {
    if (time[2] > 60) {
      time[2] = time[2] - 60;
      time[1] = time[1] + 1;
    } else if (time[2] < 0) {
      time[2] = 0;
    }

    if (time[1] > 60) {
      time[1] = time[1] - 60;
      time[0] = time[0] + 1;
    } else if (time[1] < 0) {
      time[1] = 0;
    }
    return time;
  }
}