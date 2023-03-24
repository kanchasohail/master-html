import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/cubits/theme_cubit/theme_cubit.dart';

import '../../../constants/consts.dart';

Widget headerContainer({required BuildContext context , required String text }){
  return  Container(
    width: double.infinity,
    color: BlocProvider.of<ThemeCubit>(context , listen: false).themeMode == ThemeMode.dark ? darkSettingsHeaderColor : lightSettingsHeaderColor,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 12),
      child: Text(text , style: Theme.of(context).textTheme.bodyLarge,),
    ),
  );
}