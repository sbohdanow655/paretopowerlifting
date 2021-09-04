enum Weekday {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday
}

enum WorkoutType {
  LowerBody1,
  LowerBody2,
  UpperBody1,
  UpperBody2,
  FullBody1,
  FullBody2,
  FullBody3,
  RestDay
}

enum Exercise {
  Squat,
  BenchPress,
  Deadlift,
  OverheadPress,
  PendlayRow,
  Skullcrushers,
  HIITConditioning,
  Rest
}

class PrimitiveWrapper {
  var value;
  PrimitiveWrapper(this.value);
}

class Constants {
  static const double titleFontSize = 50;
  static const double buttonFontSize = 30;
  static const double settingsFontSize = 16;
  static const double workoutTabWeekdayFontSize = 13;

  static const double marginHorizontal = 40;

  static const double paddingVertical = 10;
  static const double paddingHorizontal = 20;

  static const String title = "Pareto Powerlifting";

  static const String pass = "PASS";
  static const String fail = "FAIL";

  static const String resetExercisePhases = "Reset Exercise Phases";
  static const String finishWorkoutWeek = "Finish Workout Week";

  static const String routeMainPage = "/mainPage";
  static const String routeRecoverySurvey = "/recoverySurvey";
  static const String routeStartPage = "/startPage";
  static const String routeTestWorkoutInfo = "/testWorkoutInfo";
  static const String routeWeightsSurvey = "/weightsSurvey";
  static const String routeWorkoutSchedule = "/workoutSchedule";
  static const String routeWorkoutSurvey = "/workoutSurvey";

  static const double textPaddingVertical = 10;
  static const double textPaddingHorizontal = 20;

  static const String bmiSurveyHeaderHeight = "Height";
  static const String bmiSurveyHeaderWeight = "Weight";

  static const String heightUnitInches = "Inches";
  static const String heightUnitCm = "cm";

  static const String weightUnitLbs = "lbs";
  static const String weightUnitKg = "kg";

  static const double bigWeightIncrementLbs = 5;
  static const double smallWeightIncrementLbs = 2.5;

  static const double bigWeightIncrementKg = 2;
  static const double smallWeightIncrementKg = 1;

  static const double inchesToCm = 2.5;
  static const double kgToLbs = 2.2;
  static const double bmiConstant = 703;
  static const String bmiUnderweight = "You are underweight. Better eat up!";
  static const String bmiNormal = "You are a normal weight. Try eating a bit more.";
  static const String bmiOverweight = "You are overweight. Hope you lose some!";

  static const String tabNextWorkout = "Next Workout";
  static const String tabHistory = "History";
  static const String tabSettings = "Settings";

  static const String useMicroplates = "Microplates for Upper Body";
  static const String selectWeightUnit = "Weight Unit";
  static const String selectSquatPhase = "Squat Phase";
  static const String selectBenchPressPhase = "Bench Press Phase";
  static const String selectDeadliftPhase = "Deadlift Phase";
  static const String selectFullBodyWorkoutDay1 = "Fullbody Workout Day 1";
  static const String selectFullBodyWorkoutDay2 = "Fullbody Workout Day 2";
  static const String selectFullBodyWorkoutDay3 = "Fullbody Workout Day 3";
  static const String selectLowerWorkoutDay1 = "Lower Workout Day 1";
  static const String selectUpperWorkoutDay1 = "Upper Workout Day 1";
  static const String selectLowerWorkoutDay2 = "Lower Workout Day 2";
  static const String selectUpperWorkoutDay2 = "Upper Workout Day 2";

  static const String enterWeightSquat = "Next Squat Intensity Weight";
  static const String enterWeightBenchPress = "Next Bench Press Intensity Weight";
  static const String enterWeightDeadlift = "Next Deadlift Intensity Weight";
  static const String enterWeightOverheadPress = "Next Overhead Press Intensity Weight";
  static const String enterWeightPendlayRow = "Next Pendlay Row Weight";
  static const String enterWeightSkullcrushers = "Next Skullcrushers Weight";

  static const String exerciseSquat = "Squat";
  static const String exerciseBenchPress = "Bench Press";
  static const String exerciseOverheadPress = "Overhead Press";
  static const String exerciseDeadlift = "Deadlift";
  static const String exercisePendlayRow = "Pendlay Row";
  static const String exerciseSkullcrushers = "Skullcrushers";
  static const String exerciseHIIT = "HIIT Conditioning";
  static const String exerciseRest = "Rest Day";

  static const String monday = "Monday";
  static const String tuesday = "Tuesday";
  static const String wednesday = "Wednesday";
  static const String thursday = "Thursday";
  static const String friday = "Friday";
  static const String saturday = "Saturday";
  static const String sunday = "Sunday";

  static const String restDay = "Rest Day";

  static const Map<String, Weekday> weekdayByString = {
    monday : Weekday.Monday,
    tuesday : Weekday.Tuesday,
    wednesday: Weekday.Wednesday,
    thursday : Weekday.Thursday,
    friday : Weekday.Friday,
    saturday: Weekday.Saturday,
    sunday : Weekday.Sunday
  };

  static const Map<Weekday, String> weekdayStrings = {
    Weekday.Monday : monday,
    Weekday.Tuesday : tuesday,
    Weekday.Wednesday : wednesday,
    Weekday.Thursday : thursday,
    Weekday.Friday : friday,
    Weekday.Saturday : saturday,
    Weekday.Sunday : sunday
  };

  static const Map<Weekday, int> weekdayValues = {
    Weekday.Monday : 0,
    Weekday.Tuesday : 1,
    Weekday.Wednesday : 2,
    Weekday.Thursday : 3,
    Weekday.Friday : 4,
    Weekday.Saturday : 5,
    Weekday.Sunday : 6
  };

  static const Map<Exercise, String> exerciseStrings = {
    Exercise.Squat : exerciseSquat,
    Exercise.BenchPress : exerciseBenchPress,
    Exercise.Deadlift : exerciseDeadlift,
    Exercise.OverheadPress : exerciseOverheadPress,
    Exercise.PendlayRow : exercisePendlayRow,
    Exercise.Skullcrushers : exerciseSkullcrushers,
    Exercise.HIITConditioning : exerciseHIIT,
    Exercise.Rest : exerciseRest
  };
}