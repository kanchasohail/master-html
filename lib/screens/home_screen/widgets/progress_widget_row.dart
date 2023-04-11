import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/cubits/lesson_cubit/lesson_cubit.dart';
import 'package:master_html/resources/lists/lessons_list.dart';

import '../../../constants/consts.dart';

class ProgressWidgetRow extends StatelessWidget {
  const ProgressWidgetRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final smallTextTheme = Theme.of(context).textTheme.bodySmall;
    final int completedLessonsCount = BlocProvider.of<LessonCubit>(context).getListOfCompletedLessons().length ;
    final int allLessonsCount = AllLessonsList.length ;
    final double percentage = completedLessonsCount / allLessonsCount * 100 ;
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24, top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Learning Progress",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ButtonStyle(
                                    overlayColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => Theme.of(context)
                                                .cardTheme
                                                .color!),
                                  ),
                                  child: const Text(
                                    "Ok",
                                    style: TextStyle(
                                        color: orangeColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  )),
                            ],
                            alignment: Alignment.center,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            content: SizedBox(
                              height: 180,
                              width: 100,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: Icon(
                                          Icons.info,
                                          size: 30,
                                        ),
                                      ),
                                      Text(
                                        "Info",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Complete 100% on learning progress to receive your certificate.\n",
                                    style: smallTextTheme,
                                  ),
                                  Text(
                                    "Finish quizzes to fill your progress bar. Good luck!",
                                    style: smallTextTheme,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      useSafeArea: true);
                },
                child: const Text(
                  "What's this?",
                  style: TextStyle(
                    height: 1.5,
                      color: orangeColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child:  LinearProgressIndicator(
                value: percentage / 100,
                backgroundColor: const Color(0xff986919),
                minHeight: 45,
                color: const Color(0xffFEA000),
              ),
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${percentage.toStringAsFixed(2)}%",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ))
          ]),
        ],
      ),
    );
  }
}
