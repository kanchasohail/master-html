import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/consts.dart';
import '../../../cubits/theme_cubit/theme_cubit.dart';
import '../../../main.dart';

class ChangeThemePopUp extends StatelessWidget {
  const ChangeThemePopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? themeMode = pref.getString(currentThemeString);
    return AlertDialog(
      content: SizedBox(
        height: 220,
        width: 100,
        child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
          if (state is ThemeDarkState || themeMode == darkThemeString) {
            return radioListItems(context, darkThemeString);
          } else if (state is ThemeLightState ||
              themeMode == lightThemeString) {
            return radioListItems(context, lightThemeString);
          } else {
            return radioListItems(context, systemThemeString);
          }
        }),
      ),
    );
  }
}

Widget radioListItems(BuildContext context, String groupValue) {
  final themeBloc = BlocProvider.of<ThemeCubit>(context);
  return Column(
    children: [
      Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Theme",
            style: Theme.of(context).textTheme.bodyLarge,
          )),
      RadioMenuButton(
          value: lightThemeString,
          groupValue: groupValue,
          onChanged: (val) {
            themeBloc.toggleTheme(false);
          },
          child: const Text("Light theme")),
      RadioMenuButton(
          value: darkThemeString,
          groupValue: groupValue,
          onChanged: (val) {
            themeBloc.toggleTheme(true);
          },
          child: const Text("Dark theme")),
      RadioMenuButton(
          value: systemThemeString,
          groupValue: groupValue,
          onChanged: (val) {
            themeBloc.toggleTheme(null);
          },
          child: const Text("System theme")),
      Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"))),
    ],
  );
}
