import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/cubits/fonts_cubit/font_size_cubit.dart';
import 'package:master_html/cubits/fonts_cubit/fonts_family_cubit.dart';
import 'package:master_html/resources/lessons.dart';

import '../../constants/consts.dart';
import '../../cubits/theme_cubit/theme_cubit.dart';

class LearningScreen extends StatelessWidget {
  static const routeName = "/learning-screen";
  const LearningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double currentFontSize = BlocProvider.of<FontSizeCubit>(context).getCurrentFontSize.toDouble() ;
    final String currentFontFamily = BlocProvider.of<FontFamilyCubit>(context).getCurrentFontFamily ;
    final bool isDarkMode = BlocProvider.of<ThemeCubit>(context , listen: false).themeMode == ThemeMode.dark ;
    // final Map<String , dynamic> lessons = jsonDecode(introductionLesson);
    final Map<String , dynamic> lessons = jsonDecode(introductionLesson);
    final List<dynamic> lessonsList = lessons['introduction']?.map((element) => element ).toList() as List<dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Let's Learn !"),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...lessonsList.map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(e['head'] , style: const TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),),
                          Text(e['article'], style: TextStyle(fontSize: currentFontSize , fontFamily: currentFontFamily),)
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
    );
  }
}
