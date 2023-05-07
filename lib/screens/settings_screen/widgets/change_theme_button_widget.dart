import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/main.dart';

import '../../../cubits/theme_cubit/theme_cubit.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return Transform.scale(
      scale: 0.9,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final bool isOn = pref.getBool(isDarkThemeStringKey) ?? true ;
          if (state is ThemeDarkState || isOn) {
            return CupertinoSwitch(
              activeColor: CupertinoColors.activeOrange,
                value: true,
                onChanged: (value) {
                  themeCubit.toggleTheme(value , ctx: context);
                });
          } else {
            return CupertinoSwitch(
                value: false,
                onChanged: (value) {
                  themeCubit.toggleTheme(value , ctx: context);
                });
          }
        },
      ),
    );
  }
}
