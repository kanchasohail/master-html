import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/main.dart';

import '../../../cubits/theme_cubit/theme_cubit.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final bool isOn = pref.getBool(isDarkThemeString) ?? true ;
        if (state is ThemeDarkState || isOn) {
          return CupertinoSwitch(
              value: true,
              onChanged: (value) {
                themeCubit.toggleTheme(value);
              });
        } else {
          return CupertinoSwitch(
              value: false,
              onChanged: (value) {
                themeCubit.toggleTheme(value);
              });
        }
      },
    );
  }
}
