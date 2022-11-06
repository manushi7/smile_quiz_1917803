import 'package:flutter/material.dart';

import 'dart:math' as math;


import 'package:smile_quiz/controller/question_api_service.dart';
import 'package:smile_quiz/model/question_api_model.dart';

import '../utils/api_response.dart';



class QuestionApiProvider with ChangeNotifier {
  final _apiServices = QuestionApiService();
  List<int> viewAnswer = [];
  List<int> randomAnswer = List<int>.generate(10, (index) => index + 1);
  final random = math.Random();

  ApiResponse<QuestionApiModel>? responseList;

  Future<void> getApiService() async {
    questionAnswers(ApiResponse.loading());
    _apiServices.getQuestionAnswer().then((value) {
      questionAnswers(ApiResponse.completed(value));
      addSolution();
    }).onError((error, stackTrace) {
      questionAnswers(ApiResponse.error(error.toString()));
    });
  }

  questionAnswers(ApiResponse<QuestionApiModel> response) {
    responseList = response;
    notifyListeners();
  }

  void addSolution() {
    viewAnswer.clear();
    viewAnswer.add(responseList!.data?.solution ?? 0);

    while (viewAnswer.length != 4) {
      var randomValue = random.nextInt(randomAnswer.length);
      if (!viewAnswer.contains(randomValue)) {
        viewAnswer.add(randomValue);
      }
    }
    viewAnswer.shuffle();
  }
}