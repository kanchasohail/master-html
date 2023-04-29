import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/screens/code_screen/widgets/wrap_code_switch.dart';

import '../../../constants/consts.dart';
import '../../../cubits/codes_cubit/code_cubit.dart';
import '../../../cubits/theme_cubit/theme_cubit.dart';

class CodeThemeChangingCard extends StatelessWidget {
  const CodeThemeChangingCard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final codeCubit = BlocProvider.of<CodeCubit>(context);
    final bool isDarkMode =
        BlocProvider.of<ThemeCubit>(context, listen: false).themeMode ==
            ThemeMode.dark;
    return  Card(
      elevation: 4,
      color: Colors.blueGrey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8 , horizontal: 10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Code theme" , style: TextStyle(fontSize: 18 , fontFamily: 'RobotoMedium', color: Colors.white),),
            const SizedBox(height: 5,),
            BlocBuilder<CodeCubit , CodeState>(
                builder: (context , state) {
                  final String currentCodeThemeName = codeCubit.getCurrentCodeThemeName() ;
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: codeThemesList.map((codeTheme) => GestureDetector(
                        onTap: (){
                          codeCubit.changeCodeTheme(codeTheme);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)
                              ),
                              color: currentCodeThemeName == codeTheme ? orangeColor : isDarkMode ? Colors.black54 : Colors.green.shade100,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0 , vertical: 8),
                                child: Text(codeTheme),
                              )),
                        ),
                      )).toList()
                  );
                }
            ) ,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Wrap Code", style: TextStyle(fontSize: 18 , fontFamily: 'RobotoMedium' , color: Colors.white)),
                BlocBuilder<CodeCubit , CodeState>(
                    builder: (context , state) {
                      return const WrapCodeSwitch();
                    }
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

