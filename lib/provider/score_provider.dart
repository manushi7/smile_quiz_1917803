import 'dart:developer';

import 'package:flutter/material.dart';

class ScoreProvider extends ChangeNotifier {
  int totalScore = 0;
  int questionNum = 1;
  
  setTotalScore() {
    totalScore += 2;

    notifyListeners();
  }

  resetTotalScore() {
    totalScore = 0;
    notifyListeners();
  }

  setQuestionNum() {
    questionNum++;
    notifyListeners();
  }

  getQuestionNum() {
    questionNum = 1;
    notifyListeners();
  }

 
}