import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/consts.dart';
import '../../../cubits/theme_cubit/theme_cubit.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        if (state is ThemeDarkState) {
          return Switch.adaptive(
              value: true,
              onChanged: (value) {
                themeCubit.toggleTheme( value);
              });
        } else {
          return Switch.adaptive(
              value: false,
              onChanged: (value) {
                themeCubit.toggleTheme(value);
              });
        }
      },
    );
  }
}
