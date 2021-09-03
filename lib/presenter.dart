import './view.dart';

class Presenter {

  static View view;

  static View run() {    
    view = View();
    return view;
  }
}

