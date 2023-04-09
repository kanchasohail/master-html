import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/cubits/fonts_cubit/font_size_cubit.dart';
import 'package:master_html/cubits/fonts_cubit/fonts_family_cubit.dart';
import 'package:master_html/resources/lessons.dart';
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
    pref.setBool("isGetStarted", false).then((value) {
      BlocProvider.of<ThemeCubit>(context).updateIsGetStarted() ;
    });
    final double currentFontSize = BlocProvider.of<FontSizeCubit>(context).getCurrentFontSize.toDouble() ;
    final String currentFontFamily = BlocProvider.of<FontFamilyCubit>(context).getCurrentFontFamily ;
    final bool isDarkMode = BlocProvider.of<ThemeCubit>(context , listen: false).themeMode == ThemeMode.dark ;
    final Object?  argument = ModalRoute.of(context)?.settings.arguments ;
    final String lessonName = argument.toString() == "null" ? "Introduction2" : argument.toString() ;
    final List<LessonModel> lessonsList = allLessons[lessonName]!.map((e) => LessonModel(header: e['head']!, article: e['article']!, codeExample: e['code_example']!, fact: e['fact']!)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(lessonName),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(QuizScreen.routeName , arguments: lessonName);
          }, icon: const Icon(Icons.play_arrow))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: SizedBox(
              width: double.infinity,
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
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(element.header , style: const TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),),
                              Text(element.article, style: TextStyle(fontSize: currentFontSize , fontFamily: currentFontFamily),),
                              element.fact != "null" ? Container(
                                padding: const EdgeInsets.all(8),
                                color: Colors.blueAccent,
                                child: Text(element.fact),
                              ) : const SizedBox(),
                            ],
                          ),
                        )).toList()
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
