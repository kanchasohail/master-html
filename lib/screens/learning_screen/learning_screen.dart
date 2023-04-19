import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/common_widgets/side_drawer/side_drawer.dart';
import 'package:master_html/cubits/fonts_cubit/fonts_cubit.dart';
import 'package:master_html/cubits/learning_cubit/learning_cubit.dart';
import 'package:master_html/cubits/lesson_cubit/lesson_cubit.dart';
import 'package:master_html/resources/lessons.dart';
import 'package:master_html/resources/lists/lessons_list.dart';
import 'package:master_html/screens/code_screen/codes_main_screen.dart';
import 'package:master_html/screens/learning_screen/widgets/article_text.dart';
import 'package:master_html/screens/learning_screen/widgets/code_example.dart';
import 'package:master_html/screens/learning_screen/widgets/fact_container.dart';
import 'package:master_html/screens/learning_screen/widgets/font_changing_card.dart';
import 'package:master_html/screens/learning_screen/widgets/play_quiz_button.dart';
import 'package:master_html/screens/quiz_screen/quiz_screen.dart';

import '../../constants/consts.dart';
import '../../cubits/theme_cubit/theme_cubit.dart';
import '../../main.dart';
import '../../resources/models/lesson_model.dart';

class LearningScreen extends StatelessWidget {
  static const routeName = "/learning-screen";

  const LearningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    pref.setBool(isGetStartedKey, false).then((value) {
      BlocProvider.of<ThemeCubit>(context).updateIsGetStarted();
    });
    final bool isDarkMode =
        BlocProvider.of<ThemeCubit>(context, listen: false).themeMode ==
            ThemeMode.dark;
    final int onGoingLessonIndex =
        BlocProvider.of<LessonCubit>(context).onGoingLessonIndex;
    final Object? argument = ModalRoute.of(context)?.settings.arguments;
    debugPrint(argument.toString());
    final String lessonName = argument.toString() == "null"
        ? AllLessonsList[onGoingLessonIndex]
        : argument.toString();
    debugPrint("$lessonName ***********************");
    final List<LessonModel> lessonsList = allLessons[lessonName]!
        .map((e) => LessonModel(
            header: e.header,
            article: e.article,
            codeExample: e.codeExample,
            outPutExample: e.outPutExample,
            fact: e.fact))
        .toList();
    final learningCubit = BlocProvider.of<LearningCubit>(context);

    return Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(
        centerTitle: true,
        // title: Row(
        //   children: [
        //     IconButton(onPressed: (){
        //       Navigator.of(context).pop();
        //     }, icon: const Icon(Icons.arrow_back)),
        //     Text(lessonName),
        //   ],
        // ),
        title: Text(lessonName),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {
                  learningCubit.popUpCard();
                },
                icon: BlocBuilder<LearningCubit, LearningState>(
                    builder: (context, state) {
                  if (state is LearningCardPopupState) {
                    return const Icon(CupertinoIcons.xmark);
                  } else {
                    return const Icon(Icons.menu_book_rounded , size: 31,);
                  }
                }),
                splashRadius: 28),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Card(
                color: isDarkMode ? darkAppBarColor : lightAppBarColor,
                elevation: 8,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BlocBuilder<LearningCubit, LearningState>(
                            builder: (context, state) {
                          if (state is LearningCardPopupState) {
                            return const FontChangingCard();
                          } else {
                            return const SizedBox();
                          }
                        }),
                        BlocBuilder<FontsCubit, FontsState>(
                            builder: (context, state) {
                          final fontsCubit =
                              BlocProvider.of<FontsCubit>(context);
                          final double currentFontSize =
                              fontsCubit.getCurrentFontSize.toDouble();
                          final String currentFontFamily =
                              fontsCubit.getCurrentFontFamily;
                          return Column(
                            children: [
                              ...lessonsList
                                  .map((element) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                   EdgeInsets.only(
                                                      top: currentFontSize < 16 ? 13.0 : 15, bottom: currentFontSize < 16 ? 4.5 : 5),
                                              child: Text(
                                                element.header,
                                                style: TextStyle(
                                                    fontSize: currentFontSize +
                                                        5 /* was 22 before */,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            ...element.article
                                                .map(
                                                  (article) => articleText(
                                                      article: article,
                                                      currentFontSize:
                                                          currentFontSize,
                                                      currentFontFamily:
                                                          currentFontFamily,
                                                      isDarkTheme: isDarkMode),
                                                )
                                                .toList(),
                                            codeExample(
                                                codeExample:
                                                    element.codeExample,
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                          CodesMainScreen
                                                              .routeName,
                                                          arguments: element
                                                              .codeExample);
                                                }),
                                            factContainer(
                                                factText: element.fact,
                                                context: context,
                                                fontSize: currentFontSize,
                                                fontFamily: currentFontFamily),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                              playQuizButton(onPressed: () {
                                Navigator.of(context).pushNamed(
                                    QuizScreen.routeName,
                                    arguments: lessonName);
                              }),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
