import 'package:nit_quiz/model/models.dart';
import 'package:nit_quiz/model/question_model.dart';

class Quiz {
  final String? name;
  final String? id;
  final List<Question>? question;

  Quiz(
      {required this.name,
      required this.id,
      required this.question});
}

List<Quiz> quizData = [
  Quiz(
      name: 'Mathematics',
      id: 'math1',
      question: [
        Question(text: 'What is the Result of 1+1 ?',
            choices: [
          Answer(text: '2', correct: true),
          Answer(text: '20', correct: false),
          Answer(text: '10', correct: false),
          Answer(text: '3', correct: false),
        ]),
        Question(text: 'What is the Result of 2*2 ?', choices: [
          Answer(text: '2', correct: false),
          Answer(text: '20', correct: false),
          Answer(text: '10', correct: false),
          Answer(text: '4', correct: true),
        ]),
        Question(text: 'What is the Result of 1*22 ?', choices: [
          Answer(text: '22', correct: true),
          Answer(text: '20', correct: false),
          Answer(text: '23', correct: false),
          Answer(text: '3', correct: false),
        ]),
        Question(text: 'What is the Result of 10/5 ?', choices: [
          Answer(text: '10', correct: false),
          Answer(text: '5', correct: false),
          Answer(text: '2', correct: true),
          Answer(text: '3', correct: false),
        ]),
        Question(text: 'What is the Result of 12-10 ?', choices: [
          Answer(text: '10', correct: false),
          Answer(text: '5', correct: false),
          Answer(text: '2', correct: true),
          Answer(text: '3', correct: false),
        ]),
      ]),
  Quiz(
      name: 'English',
      id: 'en1',
      question: [
        Question(text: 'A word that begins with the letter C ?', choices: [
          Answer(text: 'Dog', correct: false),
          Answer(text: 'Cat', correct: true),
          Answer(text: 'Word', correct: false),
          Answer(text: 'Quiz', correct: false),
        ]),
        Question(text: ' She works ---- Saturday ?', choices: [
          Answer(text: 'at', correct: false),
          Answer(text: 'to', correct: false),
          Answer(text: 'in', correct: false),
          Answer(text: 'on', correct: true),
        ]),
        Question(text: 'Who is the best player in the world in 2021 ?', choices: [
          Answer(text: 'Messi', correct: false),
          Answer(text: 'Mo. salah', correct: false),
          Answer(text: 'Lewandowski', correct: true),
          Answer(text: 'C.Ronaldo', correct: false),
        ]),
        Question(text: 'How many players are on a soccer team on the field ?', choices: [
          Answer(text: '10', correct: false),
          Answer(text: '11', correct: true),
          Answer(text: '32', correct: false),
          Answer(text: '18', correct: false),
        ]),
        Question(text: 'How old are you ?', choices: [
          Answer(text: 'Iam 8 ears old', correct: false),
          Answer(text: 'I 8 years rolled', correct: false),
          Answer(text: 'Iam 8 year old', correct: false),
          Answer(text: 'Iam 8 years old', correct: true),
        ]),
      ]),
  Quiz(
      name: 'عربي',
      id: 'ar1',
      question: [
        Question(text: 'ما هى عاصمة مصر؟', choices: [
          Answer(text: 'القاهرة', correct: true),
          Answer(text: 'الجيزه', correct: false),
          Answer(text: 'اسكندرية', correct: false),
          Answer(text: 'اسيوط', correct: false),
        ]),
        Question(text: 'كم عدد احزاب القران الكريم؟', choices: [
          Answer(text: '٣٣', correct: false),
          Answer(text: '٧', correct: true),
          Answer(text: '٣٠', correct: false),
          Answer(text: '٣', correct: false),
        ]),
        Question(text: 'من هو الصحابى الذى كلمه الله بدون حجاب؟', choices: [
          Answer(text: 'ابو بكر الصديق', correct: false),
          Answer(text: 'عثمان بن عفان ', correct: false),
          Answer(text: 'عمر بن الخطاب ', correct: false),
          Answer(text: 'عبد الله بن عمرو', correct: true),
        ]),
        Question(text: 'من هو الصحابى الملقب بسيف الله؟', choices: [
          Answer(text: 'خالد بن الوليد', correct: true),
          Answer(text: 'عمرو بن العاص', correct: false),
          Answer(text: 'الوليد بن الوليد ', correct: false),
          Answer(text: 'ابو بكر الصديق', correct: false),
        ]),
        Question(text: 'من هو النبي الذي ولد مرتين؟', choices: [
          Answer(text: 'ادريس عليه السلام', correct: true),
          Answer(text: 'يوسف الصديق ', correct: false),
          Answer(text: 'نبي الله سليمان', correct: false),
          Answer(text: 'اّدم عليه السلام ', correct: false),
        ]),
      ]),
];
