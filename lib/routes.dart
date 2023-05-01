import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/cubits/codes_cubit/code_cubit.dart';
import 'package:master_html/screens/code_screen/codes_main_screen.dart';
import 'package:master_html/screens/profile_screen/profile_screen.dart';
import 'package:master_html/screens/quiz_screen/quiz_screen.dart';
import 'package:master_html/screens/result_screen/result_screen.dart';
import 'package:master_html/screens/settings_screen/settings_screen.dart';

import 'constants/consts.dart';
import 'cubits/profile_cubit/profile_image_cubit.dart';
import 'cubits/profile_cubit/user_name_cubit.dart';
import 'cubits/quiz_cubit/quiz_cubit.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
//Codes main screen
      case CodesMainScreen.routeName:
        CodeCubit.codeCubitCodeString = settings.arguments as String?;
        return MaterialPageRoute(
            builder: (context) => const CodesMainScreen());
//Settings screen
      case SettingScreen.routeName:
        return MaterialPageRoute(builder: (context) => const SettingScreen());
//Learning screen
//       case LearningScreen.routeName:
//         return MaterialPageRoute(builder: (context) =>  const LearningScreen());
//Result screen
      case ResultScreen.routeName:
        final Map<String, dynamic> argumentsData =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => ResultScreen(
                  argsData: argumentsData,
                ));
//Quiz screen
      case QuizScreen.routeName:
        final String lessonNameArgument = settings.arguments as String;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => QuizCubit(),
                child: QuizScreen(lessonName: lessonNameArgument)));
//Profile screen
      case ProfileScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider(
                    create: (context) => ProfileImageCubit(),
                  ),
                  BlocProvider(
                    create: (context) => UserNameCubit(),
                  ),
                ], child: const ProfileScreen()));

      default:
        return null;
    }
  }
}
