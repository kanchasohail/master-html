import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/common_widgets/side_drawer/side_drawer.dart';
import 'package:master_html/cubits/fonts_cubit/font_size_cubit.dart';
import 'package:master_html/cubits/fonts_cubit/fonts_family_cubit.dart';
import 'package:master_html/cubits/lesson_cubit/lesson_cubit.dart';
import 'package:master_html/resources/lessons.dart';
import 'package:master_html/resources/lists/lessons_list.dart';
import 'package:master_html/screens/code_screen/codes_main_screen.dart';
import 'package:master_html/screens/learning_screen/widgets/code_example.dart';
import 'package:master_html/screens/learning_screen/widgets/fact_container.dart';
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
      BlocProvider.of<ThemeCubit>(context).updateIsGetStarted() ;
    });
    final double currentFontSize = BlocProvider.of<FontSizeCubit>(context).getCurrentFontSize.toDouble() ;
    final String currentFontFamily = BlocProvider.of<FontFamilyCubit>(context).getCurrentFontFamily ;
    final bool isDarkMode = BlocProvider.of<ThemeCubit>(context , listen: false).themeMode == ThemeMode.dark ;
    final Object?  argument = ModalRoute.of(context)?.settings.arguments ;
    final int onGoingLessonIndex = BlocProvider.of<LessonCubit>(context).onGoingLesson ;
    final String lessonName = argument.toString() == "null" ? AllLessonsList[onGoingLessonIndex] : argument.toString() ;
    final List<LessonModel> lessonsList = allLessons[lessonName]!.map((e) => LessonModel(header: e['head']!, article: e['article']!, codeExample: e['code_example']!, fact: e['fact']!)).toList();
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
                    return true ;
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ...lessonsList.map((element) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(element.header , style: const TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),),
                              ),
                              ...element.article.map((article) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Text(article, style: TextStyle(fontSize: currentFontSize , fontFamily: currentFontFamily),),
                              ),
                              ).toList(),
                              codeExample(codeExample: element.codeExample, onTap: (){
                                Navigator.of(context).pushNamed(CodesMainScreen.routeName , arguments: element.codeExample);
                              }),
                              factContainer(factText: element.fact , context:context , fontSize: currentFontSize , fontFamily: currentFontFamily),
                            ],
                          ),
                        )).toList() ,
                        playQuizButton(onPressed: (){
                          Navigator.of(context).pushNamed(QuizScreen.routeName , arguments: lessonName);
                        })
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
