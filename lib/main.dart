import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/cubits/fonts_cubit/font_size_cubit.dart';
import 'package:master_html/cubits/lesson_cubit/lesson_cubit.dart';
import 'package:master_html/routes.dart';
import 'package:master_html/screens/home_screen/home_screen.dart';
import 'package:master_html/screens/learning_screen/learning_screen.dart';
import 'package:master_html/screens/splash_screen/splash_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'constants/my_themes.dart';
import 'cubits/fonts_cubit/fonts_family_cubit.dart';
import 'cubits/theme_cubit/theme_cubit.dart';

late SharedPreferences pref;

Future<void> main() async {
  // runApp(const SplashScreen());
  // await Future.delayed(const Duration(seconds: 3));

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
        BlocProvider<FontSizeCubit>(create: (context) => FontSizeCubit()),
        BlocProvider<FontFamilyCubit>(create: (context) => FontFamilyCubit()),
        BlocProvider<LessonCubit>(create: (context) => LessonCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
        final themeCubit = BlocProvider.of<ThemeCubit>(context);
        themeCubit.getInitialTheme(pref);
        final bool isGetStarted = themeCubit.isGetStarted();
        return MaterialApp(
          title: 'Master Html',
          debugShowCheckedModeBanner: true,
          // showPerformanceOverlay: true,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          themeMode: themeCubit.themeMode,
          onGenerateRoute: Routes.onGenerateRoute,
          routes: {
                  LearningScreen.routeName : (context) => const LearningScreen(),
          },
          home: HomeScreen(isGetStarted: isGetStarted),
        );
      }),
    );
  }
}
