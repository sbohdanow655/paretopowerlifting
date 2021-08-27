enum Programs {
  novice,
  intermediate
}

enum HeightUnit {
  inches,
  cm
}

enum WeightUnit {
  lbs,
  kg
}

class Constants {
  static const String title = "Pareto Powerlifting";
  static const double titleFontSize = 50;

  static const double headerFontSize = 30;
  static const String headerSelectProgram = "Select a program";

  static const String selectNovice = "Novice";
  static const String selectIntermediate = "Intermediate";

  static const double buttonPaddingVertical = 10;
  static const double buttonPaddingHorizontal = 20;
  static const double buttonFontSize = 30;

  static const double marginHorizontal = 40;

  static const String routeBeginnerInfo = "/beginnerInfo";
  static const String routeBMISurvey = "/bmiSurvey";
  static const String routeHowToBenchPress = "/howToBenchPress";
  static const String routeHowToDeadlift = "/howToDeadlift";
  static const String routeHowToSquat = "/howToSquat";
  static const String routeRecoverySurvey = "/recoverySurvey";
  static const String routeStartPage = "/startPage";
  static const String routeTestWorkoutInfo = "/testWorkoutInfo";
  static const String routeWeightsSurvey = "/weightsSurvey";
  static const String routeWorkoutSchedule = "/workoutSchedule";
  static const String routeWorkoutSurvey = "/workoutSurvey";

  static const double textPaddingVertical = 10;
  static const double textPaddingHorizontal = 20;

  static const String beginnerInfoText1 = "Powerlifting is the performance of the squat, bench press, and deadlift. In a competition, participants lift high intensity singles and are scored based on the total of the 3 weights.";
  static const String beginnerInfoText2 = "As a trainee, consistency and good form play the biggest roles in progress. For exercise scheduling, simple and hard is effective.";
  static const String beginnerInfoText3 = "As a beginner, you will start with the 3 main exercises, 3 times per week. To perform these exercises, you need an olympic barbell, a squat rack, and a flat bench. DO NOT USE A SMITH MACHINE, where the bar is fixed on a track.";
 
  static const String bmiSurveyHeaderHeight = "Height";
  static const String bmiSurveyHeaderWeight = "Weight";

  static const String heightUnitInches = "Inches";
  static const String heightUnitCm = "cm";

  static const String weightUnitLbs = "lbs";
  static const String weightUnitKg = "kg";

  static const double inchesToCm = 2.5;
  static const double kgToLbs = 2.2;
  static const double bmiConstant = 703;
  static const String bmiUnderweight = "You are underweight. Better eat up!";
  static const String bmiNormal = "You are a normal weight. Try eating a bit more.";
  static const String bmiOverweight = "You are overweight. Hope you lose some!";

}