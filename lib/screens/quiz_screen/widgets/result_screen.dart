import 'package:flutter/cupertino.dart';

import '../../../constants/consts.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = '/result-screen';

  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> argsData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final List<Map<String, dynamic>> playedQuiz = argsData['playedQuiz'];
    final int correctAnswersCount = argsData['correctAnswerCount'];
    final String resultText = argsData['resultText'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Quiz Result"),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24),
                      child: Text(
                        resultText,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, bottom: 18),
                      child: Text(
                          "You've got $correctAnswersCount out of ${playedQuiz.length} questions correct." , style: const TextStyle(fontSize: 18),),
                    ),
                    Expanded(
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification:
                            (OverscrollIndicatorNotification overscroll) {
                          overscroll.disallowIndicator();
                          return true;
                        },
                        child: ListView.builder(
                            itemCount: playedQuiz.length,
                            itemBuilder: (context, index) {
                              final Color borderColor = playedQuiz[index]
                                      ['isCorrect']
                                  ? const Color(0xff306e2e)
                                  : const Color(0xff8c2a23);
                              return Container(
                                width: double.infinity,
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.symmetric(horizontal: 8 , vertical: 12),
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                        color: borderColor, width: 8),
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
                                      "${index + 1}. ${playedQuiz[index]['question']}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge
                                          ?.copyWith(
                                        fontSize: 19, fontFamily: 'RobotoMedium'),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        playedQuiz[index]['isCorrect']
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
                                        Text(playedQuiz[index]
                                            ['selectedAnswer']),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
