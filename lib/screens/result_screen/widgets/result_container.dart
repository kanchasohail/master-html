import 'package:flutter/cupertino.dart';

import '../../../constants/consts.dart';

Widget resultContainer(
    {required bool isCorrect,
    required String questionText,
    required String selectedAnswer,
    required BuildContext context}) {
  final Color borderColor =
      isCorrect ? const Color(0xff306e2e) : const Color(0xff8c2a23);
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.all(8),
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    decoration: BoxDecoration(
      border: Border(
        left: BorderSide(color: borderColor, width: 8),
        right: BorderSide(
          color: borderColor,
        ),
        top: BorderSide(
          color: borderColor,
        ),
        bottom: BorderSide(
          color: borderColor,
        ),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          // "${index + 1}. ${playedQuiz[index]['question']}",
          questionText,
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(fontSize: 19, fontFamily: 'RobotoMedium'),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            // playedQuiz[index]['isCorrect']
            isCorrect
                ? const Icon(
                    Icons.check,
                    color: greenColor,
                    size: 19,
                  )
                : const Icon(
                    CupertinoIcons.xmark,
                    color: redColor,
                    size: 19,
                  ),
            const SizedBox(width: 5),
            // Text(playedQuiz[index]
            // ['selectedAnswer']),
            Text(selectedAnswer),
          ],
        ),
        const SizedBox(height: 10),
      ],
    ),
  );
}
