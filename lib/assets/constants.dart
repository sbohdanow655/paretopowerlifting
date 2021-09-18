import 'dart:ui';

enum Weekday { Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday }

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

class Constants {
  static const String EMPTYSTRING = "";

  static const double FONTSIZE_TITLE = 50;
  static const double FONTSIZE_BUTTON = 30;
  static const double FONTSIZE_TAB_SETTINGS = 16;
  static const double FONTSIZE_TAB_WORKOUTS = 13;

  static const double MARGIN_HORIZONTAL = 40;

  static const double PADDING_VERTICAL = 10;
  static const double PADDING_HORIZONTAL = 20;

  static const String TITLE = "Pareto Powerlifting";

  static const String PASS = "PASS";
  static const String FAIL = "FAIL";

  static const String RESET_EXERCISE_PHASES = "Start Over";
  static const String FINISH_WORKOUT_WEEK = "Advance to Next Week";

  static const String ROUTE_MAINPAGE = "/mainPage";

  static const double TEXTPADDING_VERTICAL = 10;
  static const double TEXTPADDING_HORIZONTAL = 20;

  static const String WEIGHTUNIT_LBS = "lbs";
  static const String WEIGHTUNIT_KG = "kg";

  static const double WEIGHTINCREMENT_LBS_BIG = 5;
  static const double WEIGHTINCREMENT_LBS_SMALL = 2.5;

  static const double WEIGHTINCREMENT_KG_BIG = 2;
  static const double WEIGHTINCREMENT_KG_SMALL = 1;

  static const String TAB_WORKOUTS = "Workouts";
  static const String TAB_HISTORY = "History";
  static const String TAB_SETTINGS = "Settings";

  static const String USE_MICROPLATES = "Microplates for Upper Body";
  static const String SELECT_WEIGHT_UNIT = "Weight Unit";
  static const String SELECTPHASE_SQUAT = "Squat Phase";
  static const String SELECTPHASE_BENCHPRESS = "Bench Press Phase";
  static const String SELECTPHASE_DEADLIFT = "Deadlift Phase";
  static const String SELECTWORKOUTDAY_FULLBODY_ONE = "Fullbody Day 1";
  static const String SELECTWORKOUTDAY_FULLBODY_TWO = "Fullbody Day 2";
  static const String SELECTWORKOUTDAY_FULLBODY_THREE = "Fullbody Day 3";
  static const String SELECTWORKOUTDAY_LOWERBODY_ONE = "Lower Day 1";
  static const String SELECTWORKOUTDAY_UPPERBODY_ONE = "Upper Day 1";
  static const String SELECTWORKOUTDAY_LOWERBODY_TWO = "Lower Day 2";
  static const String SELECTWORKOUTDAY_UPPERBODY_TWO = "Upper Day 2";

  static const String ENTERWEIGHT_SQUAT = "Next Squat Intensity Weight";
  static const String ENTERWEIGHT_BENCHPRESS =
      "Next Bench Press Intensity Weight";
  static const String ENTERWEIGHT_DEADLIFT = "Next Deadlift Intensity Weight";
  static const String ENTERWEIGHT_OVERHEADPRESS =
      "Next Overhead Press Intensity Weight";
  static const String ENTERWEIGHT_PENDLAYROW = "Next Pendlay Row Weight";
  static const String ENTERWEIGHT_SKULLCRUSHERS = "Next Skullcrushers Weight";

  static const String EXERCISE_SQUAT = "Squat";
  static const String EXERCISE_BENCHPRESS = "Bench Press";
  static const String EXERCISE_OVERHEADPRESS = "Overhead Press";
  static const String EXERCISE_DEADLIFT = "Deadlift";
  static const String EXERCISE_PENDLAYROW = "Pendlay Row";
  static const String EXERCISE_SKULLCRUSHERS = "Skullcrushers";
  static const String EXERCISE_HIIT = "HIIT Conditioning";
  static const String EXERCISE_REST = "Rest Day";

  static const String SUFFIX_WEIGHT = " Weight";

  static const String MONDAY = "Monday";
  static const String TUESDAY = "Tuesday";
  static const String WEDNESDAY = "Wednesday";
  static const String THURSDAY = "Thursday";
  static const String FRIDAY = "Friday";
  static const String SATURDAY = "Saturday";
  static const String SUNDAY = "Sunday";

  static const String REST_DAY = "Rest Day";

  static const Map<String, Weekday> weekdayByString = {
    MONDAY: Weekday.Monday,
    TUESDAY: Weekday.Tuesday,
    WEDNESDAY: Weekday.Wednesday,
    THURSDAY: Weekday.Thursday,
    FRIDAY: Weekday.Friday,
    SATURDAY: Weekday.Saturday,
    SUNDAY: Weekday.Sunday
  };

  static const Map<Weekday, String> weekdayStrings = {
    Weekday.Monday: MONDAY,
    Weekday.Tuesday: TUESDAY,
    Weekday.Wednesday: WEDNESDAY,
    Weekday.Thursday: THURSDAY,
    Weekday.Friday: FRIDAY,
    Weekday.Saturday: SATURDAY,
    Weekday.Sunday: SUNDAY
  };

  static const Map<Weekday, int> weekdayValues = {
    Weekday.Monday: 0,
    Weekday.Tuesday: 1,
    Weekday.Wednesday: 2,
    Weekday.Thursday: 3,
    Weekday.Friday: 4,
    Weekday.Saturday: 5,
    Weekday.Sunday: 6
  };

  static const Map<Exercise, String> exerciseStrings = {
    Exercise.Squat: EXERCISE_SQUAT,
    Exercise.BenchPress: EXERCISE_BENCHPRESS,
    Exercise.Deadlift: EXERCISE_DEADLIFT,
    Exercise.OverheadPress: EXERCISE_OVERHEADPRESS,
    Exercise.PendlayRow: EXERCISE_PENDLAYROW,
    Exercise.Skullcrushers: EXERCISE_SKULLCRUSHERS,
    Exercise.HIITConditioning: EXERCISE_HIIT,
    Exercise.Rest: EXERCISE_REST
  };

  static Map<String, Exercise> exerciseByToString = {
    Exercise.Squat.toString(): Exercise.Squat,
    Exercise.BenchPress.toString(): Exercise.BenchPress,
    Exercise.Deadlift.toString(): Exercise.Deadlift,
    Exercise.OverheadPress.toString(): Exercise.OverheadPress,
    Exercise.PendlayRow.toString(): Exercise.PendlayRow,
    Exercise.Skullcrushers.toString(): Exercise.Skullcrushers,
    Exercise.HIITConditioning.toString(): Exercise.HIITConditioning,
    Exercise.Rest.toString(): Exercise.Rest
  };

  static const String DB_PASSFAILMAP = "passFailMap";
  static const String DB_HAVE_MICROPLATES = "haveMicroplates";
  static const String DB_WEIGHT_UNIT = "weightUnit";
  static const String DB_PHASE_SQUAT = "squatPhase";
  static const String DB_PHASE_BENCHPRESS = "benchPressPhase";
  static const String DB_PHASE_DEADLIFT = "deadliftPhase";
  static const String DB_FULLBODY_ONE = "fullbody1";
  static const String DB_FULLBODY_TWO = "fullbody2";
  static const String DB_FULLBODY_THREE = "fullbody3";
  static const String DB_LOWERBODY_ONE = "lowerbody1";
  static const String DB_UPPERBODY_ONE = "upperbody1";
  static const String DB_LOWERBODY_TWO = "lowerbody2";
  static const String DB_UPPERBODY_TWO = "upperbody2";
  static const String DB_WEIGHT_SQUAT = "squatWeight";
  static const String DB_WEIGHT_BENCHPRESS = "benchPressWeight";
  static const String DB_WEIGHT_DEADLIFT = "deadliftWeight";
  static const String DB_WEIGHT_OVERHEADPRESS = "overheadPressWeight";
  static const String DB_WEIGHT_PENDLAYROW = "pendlayRowWeight";
  static const String DB_WEIGHT_SKULLCRUSHERS = "skullcrusherWeight";

  static const String WORKOUTS_HEADER_ONE =
      "1) Set the starting weights in the Settings.";
  static const String WORKOUTS_HEADER_TWO =
      "2) Switch exercises from FAIL to PASS when you successfully do all the reps.";
  static const String WORKOUTS_HEADER_THREE =
      "3) 'Advance to Next Week' after you've attempted the week.";
  static const String WORKOUTS_HEADER_FOUR =
      "4) 'Start Over' if you want to reset the exercise phases.";
  static const String WORKOUTS_HEADER_FIVE =
      "5) The week will go from a 3-day fullbody workout to a 4-day upper/lower split when one of the exercise phases in the Settings reaches 3.";

  static const String WORKOUTS_HEADER_TITLE_NUTRITION =
      "Nutrition Recommendations";
  static const String NUTRITION_RECOMMOMENDATIONS =
      "Have 2 scoops of protein powder twice per day.";

  static const String SETTINGS_HEADER_TITLE = "Getting Started";
  static const String SETTINGS_HEADER_PLATES = "Plates";
  static const String SETTINGS_HEADER_EXERCISEPHASES = "Exercise Phases";
  static const String SETTINGS_HEADER_FULLBODYWORKOUTDAYS =
      "Fullbody Workout Days";
  static const String SETTINGS_HEADER_UPPERLOWERWORKOUTDAYS =
      "Upper/Lower Workout Days";
  static const String SETTINGS_HEADER_WEIGHTS = "Weights";

  static const Color BACKGROUND_GREY = Color(0xfff5f5f5);

  static const String WORKOUTS_ADVANCE_INKWELL =
      "Weights, sets, and reps updated.";
  static const String WORKOUTS_STARTOVER_INKWELL = "Exercise phases reset.";
}
