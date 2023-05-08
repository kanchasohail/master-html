import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/cubits/ad_cubit/ad_cubit.dart';
import 'package:master_html/cubits/codes_cubit/code_cubit.dart';
import 'package:master_html/cubits/fonts_cubit/fonts_cubit.dart';
import 'package:master_html/cubits/learning_cubit/learning_cubit.dart';
import 'package:master_html/cubits/lesson_cubit/lesson_cubit.dart';
import 'package:master_html/routes.dart';
import 'package:master_html/screens/home_screen/home_screen.dart';
import 'package:master_html/screens/learning_screen/learning_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'constants/my_themes.dart';
import 'cubits/theme_cubit/theme_cubit.dart';

late SharedPreferences pref;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();
  // This will remove the splash icon only after the initialization of firebase ;
  // FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<FontsCubit>(create: (context) => FontsCubit()),
        BlocProvider<LessonCubit>(create: (context) => LessonCubit()),
        BlocProvider<CodeCubit>(create: (context) => CodeCubit()),
        BlocProvider<AdCubit>(create: (context) => AdCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
        final themeCubit = BlocProvider.of<ThemeCubit>(context);
        themeCubit.getInitialTheme(pref);
        final bool isGetStarted = themeCubit.isGetStarted();
        return MaterialApp(
          title: 'Master Html',
          debugShowCheckedModeBanner: false,
          // showPerformanceOverlay: true,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          themeMode: themeCubit.themeMode,
          onGenerateRoute: Routes.onGenerateRoute,
          routes: {
            LearningScreen.routeName: (context) => BlocProvider(
                create: (context) => LearningCubit(),
                child: const LearningScreen()),
          },
          home: HomeScreen(isGetStarted: isGetStarted),
        );
      }),
    );
  }
}
