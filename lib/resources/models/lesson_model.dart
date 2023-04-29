class LessonModel {
  const LessonModel(
      {required this.header,
      required this.article,
      required this.codeExample,
      required this.outPutExample,
      required this.fact,
      required this.update,
      required this.note,
      required this.warning});

  final String header;

  final List<String> article;

  final String codeExample;

  final String outPutExample;

  final String fact;

  final String update;

  final String note;

  final String warning;
}
