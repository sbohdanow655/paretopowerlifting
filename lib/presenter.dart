import 'package:flutter/material.dart';
import './view.dart';
import './model.dart';
import './assets/constants.dart';

class Presenter {

  static View view;

  static View run() {    
    view = View();
    return view;
  }
}

