import '../../../constants/consts.dart';

Widget articleText(
    {required String article,
    required double currentFontSize,
    required String currentFontFamily}) {
  final pattern = RegExp(
      "<(“[^”]*”|'[^’]*’|[^'”>])*>"); // matches words with exactly 5 characters
  final matches = pattern.allMatches(article);

  final List<TextSpan> textSpans = [];

  int lastMatchEnd = 0;
  for (final match in matches) {
    final preMatchText =
        article.substring(lastMatchEnd, match.start); // text before the match
    final matchText =
        article.substring(match.start, match.end); // the matched text

    // add the text before the match
    textSpans.add(TextSpan(text: preMatchText));

    // add the matched text with a yellow background color
    textSpans.add(TextSpan(
        text: matchText,
        style: const TextStyle(
            color: Colors.blueAccent, fontWeight: FontWeight.bold)));

    lastMatchEnd = match.end;
  }

  // add any remaining text after the last match
  final remainingText = article.substring(lastMatchEnd);
  textSpans.add(TextSpan(text: remainingText));
  return article != "null"
      ? Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          // child: Text(article, style: TextStyle(fontSize: currentFontSize , fontFamily: currentFontFamily),),
          child: RichText(
            text: TextSpan(
              children: textSpans,
              style: TextStyle(
                  fontSize: currentFontSize,
                  fontFamily: currentFontFamily,
                  color: Colors.white),
            ),
          ),
        )
      : const SizedBox();
}
