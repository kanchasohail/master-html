class QuizModel {
  QuizModel(
      {required this.question,
      required this.options,
      required this.correctAnswer});

  final String question;

  final List<dynamic> options;

  final String correctAnswer;
}
