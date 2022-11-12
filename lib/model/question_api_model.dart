class QuestionApiModel {
  String? question;
  int? solution;

  QuestionApiModel({this.question, this.solution});

  factory QuestionApiModel.fromJson(Map<String, dynamic> json) => QuestionApiModel(
        question: json['question'] as String?,
        solution: json['solution'] as int?,
      );
}
