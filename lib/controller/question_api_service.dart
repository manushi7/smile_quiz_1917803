import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import '../model/question_api_model.dart';
import 'package:http/http.dart' as http;



import '../utils/constants.dart';
class QuestionApiService with ChangeNotifier {
  Future<QuestionApiModel> getQuestionAnswer() async {
    try {
      final response = await http
          .get(Uri.parse(ApiUrl.questionUrl))
          .timeout(const Duration(seconds: 20));
      if (response.statusCode == 200) {
        dynamic jsonResponse = json.decode(response.body);
        // log(jsonResponse.toString(), name: "jsonRespinse");
        return QuestionApiModel.fromJson(jsonResponse);
      } else {
        throw Exception("Error with Api");
      }
    } on SocketException {
      throw Exception("No internet connection");
    }
  }
}