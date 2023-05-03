import '../../../constants/consts.dart';

Widget articleText(
    {required String article,
    required double currentFontSize,
    required String currentFontFamily,
    required bool isDarkTheme}) {
  if (article == "null") {
    return const SizedBox();
  }
  RegExp regex = RegExp(r"<(“[^”]*”|'[^’]*’|[^'”>])*>|'([\w.]+)'");
  final matches = regex.allMatches(article);

  final List<TextSpan> textSpans = [];

  int lastMatchEnd = 0;
  for (final match in matches) {
    final preMatchText =
        article.substring(lastMatchEnd, match.start); // text before the match
    final matchText =
        article.substring(match.start, match.end); // the matched text

    // add the text before the match
    textSpans.add(TextSpan(text: preMatchText));

    // add the matched text
    textSpans.add(TextSpan(
        text: matchText,
        style: const TextStyle(
            color: Colors.orange, fontWeight: FontWeight.bold)));
    lastMatchEnd = match.end;
  }
  // add any remaining text after the last match
  final remainingText = article.substring(lastMatchEnd);
  textSpans.add(TextSpan(text: remainingText));
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: RichText(
      text: TextSpan(
        children: textSpans,
        style: TextStyle(
            fontSize: currentFontSize,
            fontFamily: currentFontFamily,
            color: isDarkTheme ? const Color(0xffe3e3e3) : Colors.black),
      ),
    ),
  );
}
