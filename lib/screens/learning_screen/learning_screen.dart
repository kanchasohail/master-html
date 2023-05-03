import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/common_widgets/custom_outlined_button.dart';
import 'package:master_html/common_widgets/side_drawer/side_drawer.dart';
import 'package:master_html/cubits/fonts_cubit/fonts_cubit.dart';
import 'package:master_html/cubits/learning_cubit/learning_cubit.dart';
import 'package:master_html/cubits/lesson_cubit/lesson_cubit.dart';
import 'package:master_html/resources/lessons.dart';
import 'package:master_html/resources/lists/lessons_list.dart';
import 'package:master_html/resources/lists/photos_list.dart';
import 'package:master_html/screens/code_screen/codes_main_screen.dart';
import 'package:master_html/screens/learning_screen/widgets/article_text.dart';
import 'package:master_html/screens/learning_screen/widgets/code_example.dart';
import 'package:master_html/screens/learning_screen/widgets/fact_container.dart';
import 'package:master_html/screens/learning_screen/widgets/font_changing_card.dart';
import 'package:master_html/screens/learning_screen/widgets/output_example.dart';
import 'package:master_html/screens/learning_screen/widgets/photos_container.dart';
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
            fact: e.fact,
            update: e.update,
            note: e.note,
            warning: e.warning))
        .toList();
    final learningCubit = BlocProvider.of<LearningCubit>(context);
    //These two variables are related for scrolling
    ScrollController scrollController = ScrollController();
    double scrollOffset = 0;
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
                    scrollOffset = scrollController.offset;
                    scrollController.animateTo(-100,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                    return const Icon(CupertinoIcons.xmark);
                  } else {
                    scrollController.animateTo(scrollOffset,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                    return const Icon(
                      Icons.menu_book_rounded,
                      size: 31,
                    );
                  }
                }),
                splashRadius: 28),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Scrollbar(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Card(
                  color: isDarkMode ? darkAppBarColor : lightAppBarColor,
                  elevation: 8,
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification:
                        (OverscrollIndicatorNotification overscroll) {
                      overscroll.disallowIndicator();
                      return true;
                    },
                    child: SingleChildScrollView(
                      controller: scrollController,
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
                                    .map((element) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: currentFontSize < 16
                                                  ? 13.0
                                                  : 15,
                                              right: 12,
                                              left: 12,
                                              bottom: currentFontSize < 16
                                                  ? 4.5
                                                  : 5),
                                          child: Text(
                                            element.header,
                                            style: TextStyle(
                                                fontSize: currentFontSize +
                                                    5 /* was 22 before */,
                                                fontWeight:
                                                    FontWeight.bold , color: isDarkMode ? const Color(0xffe6e6e6) : const Color(0xff2C2C2C)),
                                          ),
                                        ),
                                        ...element.article
                                            .map(
                                              (article) => Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                                child: !photosList
                                                        .contains(article)
                                                    ? articleText(
                                                        article: article,
                                                        currentFontSize:
                                                            currentFontSize,
                                                        currentFontFamily:
                                                            currentFontFamily,
                                                        isDarkTheme:
                                                            isDarkMode)
                                                    : photosContainer(
                                                        article),
                                              ),
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
                                            },ctx: context),
                                        if (element.outPutExample !=
                                            "null")
                                          outputExample(
                                              codeExample:
                                                  element.codeExample , fontSize: currentFontSize),
                                        factContainer(
                                            factText: element.fact,
                                            fontSize: currentFontSize,
                                            fontFamily: currentFontFamily,
                                            containerColor:
                                                const Color(0xff0A272F) ,
                                        leadingIcon: const Icon(Icons.lightbulb_outlined , size: 20) ,
                                        leadingText: "Interesting Fact -"),
                                        factContainer(
                                            factText: element.update,
                                            fontSize: currentFontSize,
                                            fontFamily: currentFontFamily,
                                            containerColor:
                                                const Color(0xff230807) ,
                                        leadingIcon: const Icon(Icons.warning_amber_sharp, size: 20) ,
                                        leadingText: "Update -"),
                                        factContainer(
                                            factText: element.note,
                                            fontSize: currentFontSize,
                                            fontFamily: currentFontFamily,
                                            containerColor:
                                                const Color(0xff291903),
                                            leadingIcon: const Icon(Icons.warning_amber_sharp, size: 20),
                                        leadingText: "Note -"),
                                        factContainer(
                                            factText: element.warning,
                                            fontSize: currentFontSize,
                                            fontFamily: currentFontFamily,
                                            containerColor:
                                                const Color(0xff291903),
                                            leadingIcon: const Icon(Icons.warning_amber_sharp, size: 20),
                                        leadingText: "Warning -"),
                                      ],
                                    ))
                                    .toList(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 28.0,
                                      bottom: 12,
                                      right: 16,
                                      left: 16),
                                  child: customOutlinedButton(
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(
                                            QuizScreen.routeName,
                                            arguments: lessonName);
                                      },
                                      buttonText: "Play Quiz"),
                                ),
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
      ),
    );
  }
}
