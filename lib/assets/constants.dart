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
  Curls,
  Rest
}

enum MainExercise { Squat, BenchPress, Deadlift, OverheadPress, PendlayRow }

class Constants {
  static const String EMPTYSTRING = "";

  static const String paretoPowerliftingDBString = "paretoPowerlifting.db";
  static const String tableNameSettings = "Settings";
  static const String tableNameExerciseLogs = "ExerciseLogs";

  static const double FONTSIZE_TITLE = 50;
  static const double FONTSIZE_BUTTON = 30;
  static const double FONTSIZE_GETTINGSTARTED_TITLE = 18;
  static const double FONTSIZE_GETTINGSTARTED_BODY = 15;
  static const double FONTSIZE_TAB_SETTINGS = 16;
  static const double FONTSIZE_TAB_WORKOUTS_WEEKDAY = 22;
  static const double FONTSIZE_TAB_WORKOUTS_EXERCISE = 22;
  static const double FONTSIZE_TAB_WORKOUTS_PRESCRIPTION = 22;
  static const double FONTSIZE_TAB_WORKOUTS_PASSFAIL = 22;
  static const double FONTSIZE_TAB_WORKOUTS_BUTTON = 22;
  static const double FONTSIZE_TAB_HISTORY_EXERCISELOG = 18;

  static const double MARGIN_HORIZONTAL = 40;

  static const double PADDING_VERTICAL = 10;
  static const double PADDING_HORIZONTAL = 20;

  static const String TITLE = "Pareto Powerlifting";

  static const String PATREON_LINK = "https://www.patreon.com/Scott_bohdanow";

  static const String LIFT = "LIFT";
  static const String PASS = "PASS";
  static const String FAIL = "FAIL";

  static const String RESET_EXERCISE_PHASES = "Start Over";
  static const String FINISH_WORKOUT_WEEK = "Advance to Next Week";

  static const String ROUTE_MAINPAGE = "/mainPage";
  static const String ROUTE_GETTINGSTARTED = "/gettingStarted";

  static const String GETTINGSTARTED_START = "Start";

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

  static const String FORCEFOURDAYSPLIT = "Always 4-Day";
  static const String ENABLE_HIITCONDITIONING = "HIIT Conditioning";
  static const String ENABLE_CURLS = "Barbell Curls";
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

  static const String EXERCISE_SQUAT = "Squat";
  static const String EXERCISE_BENCHPRESS = "Bench Press";
  static const String EXERCISE_OVERHEADPRESS = "Overhead Press";
  static const String EXERCISE_DEADLIFT = "Deadlift";
  static const String EXERCISE_PENDLAYROW = "Pendlay Row";
  static const String EXERCISE_SKULLCRUSHERS = "Skullcrushers";
  static const String EXERCISE_CURLS = "Barbell Curls";
  static const String EXERCISE_HIIT = "Prowler, Bike, or Sprints";
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
    Exercise.Curls: EXERCISE_CURLS,
    Exercise.HIITConditioning: EXERCISE_HIIT,
    Exercise.Rest: EXERCISE_REST
  };

  static Map<String, Exercise> exerciseByString = {
    EXERCISE_SQUAT: Exercise.Squat,
    EXERCISE_BENCHPRESS: Exercise.BenchPress,
    EXERCISE_DEADLIFT: Exercise.Deadlift,
    EXERCISE_OVERHEADPRESS: Exercise.OverheadPress,
    EXERCISE_PENDLAYROW: Exercise.PendlayRow,
    EXERCISE_SKULLCRUSHERS: Exercise.Skullcrushers,
    EXERCISE_CURLS: Exercise.Curls,
    EXERCISE_HIIT: Exercise.HIITConditioning,
    EXERCISE_REST: Exercise.Rest
  };

  static Map<String, Exercise> exerciseByToString = {
    Exercise.Squat.toString(): Exercise.Squat,
    Exercise.BenchPress.toString(): Exercise.BenchPress,
    Exercise.Deadlift.toString(): Exercise.Deadlift,
    Exercise.OverheadPress.toString(): Exercise.OverheadPress,
    Exercise.PendlayRow.toString(): Exercise.PendlayRow,
    Exercise.Skullcrushers.toString(): Exercise.Skullcrushers,
    Exercise.HIITConditioning.toString(): Exercise.HIITConditioning,
    Exercise.Curls.toString(): Exercise.Curls,
    Exercise.Rest.toString(): Exercise.Rest
  };

  static const Map<MainExercise, Exercise> exerciseByMainExercise = {
    MainExercise.Squat: Exercise.Squat,
    MainExercise.BenchPress: Exercise.BenchPress,
    MainExercise.Deadlift: Exercise.Deadlift,
    MainExercise.OverheadPress: Exercise.OverheadPress,
    MainExercise.PendlayRow: Exercise.PendlayRow
  };

  static Map<String, Exercise> exerciseByMainExerciseString = {
    MainExercise.Squat.toString(): Exercise.Squat,
    MainExercise.BenchPress.toString(): Exercise.BenchPress,
    MainExercise.Deadlift.toString(): Exercise.Deadlift,
    MainExercise.OverheadPress.toString(): Exercise.OverheadPress,
    MainExercise.PendlayRow.toString(): Exercise.PendlayRow
  };

  static const String SettingsDB_PASSFAILMAP = "passFailMap";
  static const String SettingsDB_FORCEFOURDAYSPLIT = "forceFourDaySplit";
  static const String SettingsDB_OPTIONAL_CURLS = "doCurls";
  static const String SettingsDB_OPTIONAL_HIITCONDITIONING = "doHIIT";
  static const String SettingsDB_HAVE_MICROPLATES = "haveMicroplates";
  static const String SettingsDB_WEIGHT_UNIT = "weightUnit";
  static const String SettingsDB_PHASE_SQUAT = "squatPhase";
  static const String SettingsDB_PHASE_BENCHPRESS = "benchPressPhase";
  static const String SettingsDB_PHASE_DEADLIFT = "deadliftPhase";
  static const String SettingsDB_FULLBODY_ONE = "fullbody1";
  static const String SettingsDB_FULLBODY_TWO = "fullbody2";
  static const String SettingsDB_FULLBODY_THREE = "fullbody3";
  static const String SettingsDB_LOWERBODY_ONE = "lowerbody1";
  static const String SettingsDB_UPPERBODY_ONE = "upperbody1";
  static const String SettingsDB_LOWERBODY_TWO = "lowerbody2";
  static const String SettingsDB_UPPERBODY_TWO = "upperbody2";
  static const String SettingsDB_WEIGHT_SQUAT = "squatWeight";
  static const String SettingsDB_WEIGHT_BENCHPRESS = "benchPressWeight";
  static const String SettingsDB_WEIGHT_DEADLIFT = "deadliftWeight";
  static const String SettingsDB_WEIGHT_OVERHEADPRESS = "overheadPressWeight";
  static const String SettingsDB_WEIGHT_PENDLAYROW = "pendlayRowWeight";

  static const String ExerciseLogDB_EXERCISE = "exercise";
  static const String ExerciseLogDB_WEIGHT_UNIT = "weightUnit";
  static const String ExerciseLogDB_WEIGHT = "weight";
  static const String ExerciseLogDB_SETS = "numSets";
  static const String ExerciseLogDB_REPS = "numReps";
  static const String ExerciseLogDB_DIDPASS = "didPass";

  static const String DONATE_BUTTON = "Donate to my Patreon";
  static const String GETTINGSTARTED_TITLE = "Getting Started";

  static const String GETTINGSTARTED_ONE =
      "1) Set the Squat, Bench Press, Deadlift, and Overhead Press starting weights to A WEIGHT YOU CAN DO 8 REPS FOR. Set the Pendlay Row to a weight you can do 12 reps for.";
  static const String GETTINGSTARTED_TWO =
      "2) Switch exercises from LIFT to PASS when you successfully do all the reps, or otherwise to FAIL.";
  static const String GETTINGSTARTED_THREE =
      "3) 'Advance to Next Week' after you've attempted the week.";
  static const String GETTINGSTARTED_FOUR =
      "4) 'Start Over' if you want to reset the exercise phases.";
  static const String GETTINGSTARTED_FIVE =
      "5) The week will go from a 3-day fullbody workout to a 4-day upper/lower split when it is appropriate or when forced by the setting.";

  static const String GETTINGSTARTED_SIX =
      "6) You can rest between Squat and Deadlift sets for 1 min to 7-10 min, depending on how far along you are. You can rest for Bench Press, Overhead Press, and Pendlay Row for 1 min to 3-5 minutes.";

  static const String GETTINGSTARTED_TITLE_NUTRITION =
      "Nutrition Recommendations";
  static const String NUTRITION_RECOMMOMENDATIONS =
      "Have 2 scoops of protein powder twice per day.";

  static const String SETTINGS_HEADER_FORCEFOURDAYSPLIT =
      "4-Day Upper/Lower Split";
  static const String SETTINGS_HEADER_PLATES = "Plates";
  static const String SETTINGS_HEADER_EXERCISEPHASES = "Exercise Phases";
  static const String SETTINGS_HEADER_FULLBODYWORKOUTDAYS =
      "Fullbody Workout Days";
  static const String SETTINGS_HEADER_UPPERLOWERWORKOUTDAYS =
      "Upper/Lower Workout Days";
  static const String SETTINGS_HEADER_WEIGHTS = "Weights";
  static const String SETTINGS_HEADER_OPTIONALEXERCISES = "Optional Exercises";

  static const Color BACKGROUND_GREY = Color(0xfff5f5f5);

  static const String WORKOUTS_SNACKBAR_INCOMPLETE =
      "You didn't complete the week yet.";
  static const String WORKOUTS_SNACKBAR_ADVANCE =
      "Weights, sets, and reps updated.";
  static const String WORKOUTS_SNACKBAR_STARTOVER = "Exercise phases reset.";

  static const String HISTORY_NOHISTORY =
      "There is no history for this exercise yet.";
}
