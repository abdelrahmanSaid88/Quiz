import 'package:nit_quiz/model/models.dart';

import 'answer_model.dart';

class Question {
  final String? text;
  final List<Answer>? choices;
  Quiz? quiz;

  Question({this.quiz, required this.text, required this.choices});
}
