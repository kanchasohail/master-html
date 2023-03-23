import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/screens/code_screen/codes_main_screen.dart';
import 'package:master_html/screens/home_screen/home_screen.dart';
import 'package:master_html/screens/settings_screen/settings_screen.dart';
import 'package:master_html/screens/splash_screen/splash_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'constants/my_themes.dart';
import 'cubits/theme_cubit/theme_cubit.dart';

late SharedPreferences pref;

Future<void> main() async {
  runApp(const SplashScreen());
  await Future.delayed(const Duration(seconds: 3));

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
    return BlocProvider(
      create: (ctx) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
        final themeCubit = BlocProvider.of<ThemeCubit>(context);
        themeCubit.getInitialTheme(pref);
        return MaterialApp(
          title: 'Learn Html',
          debugShowCheckedModeBanner: true,
          // showPerformanceOverlay: true,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          themeMode: themeCubit.themeMode,
          routes: {
            CodesMainScreen.routeName: (context) => const CodesMainScreen(),
            SettingScreen.routeName: (context) => const SettingScreen(),
          },
          home: const HomeScreen(),
        );
      }),
    );
  }
}
