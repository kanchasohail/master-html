import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/cubits/fonts_cubit/fonts_cubit.dart';

import '../../../constants/consts.dart';
import '../../../cubits/theme_cubit/theme_cubit.dart';

class FontChangingCard extends StatelessWidget {
  const FontChangingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontsCubit = BlocProvider.of<FontsCubit>(context);
    final bool isDarkMode =
        BlocProvider.of<ThemeCubit>(context, listen: false).themeMode ==
            ThemeMode.dark;
    return  Card(
      elevation: 6,
      color: Colors.blueGrey,
      shadowColor: Colors.blue,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8 , horizontal: 10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Font Size", style: TextStyle(fontSize: 18 , fontFamily: 'RobotoMedium' , color: Colors.white)),
                BlocBuilder<FontsCubit , FontsState>(
                  builder: (context , state) {
                    return Row(
                      children: [
                        IconButton(onPressed: fontsCubit.isLeastFontSize   ?  null :  (){
                          fontsCubit.decrementFontSize(fontsCubit.getCurrentFontSize);
                        }, icon: const Icon(CupertinoIcons.minus) , splashRadius: 22,),
                         Text(fontsCubit.getCurrentFontSize.toString() , style: const TextStyle(fontSize: 18 , fontFamily: 'RobotoMedium', color: Colors.white),),
                        IconButton(onPressed: fontsCubit.isHighestFontSize ?null : (){
                          fontsCubit.incrementFontSize(fontsCubit.getCurrentFontSize);
                        }, icon: const Icon(CupertinoIcons.plus), splashRadius: 22,),
                      ],
                    );
                  }
                )
              ],
            ),
            const SizedBox(height: 10,),
            const Text("Font family" , style: TextStyle(fontSize: 18 , fontFamily: 'RobotoMedium', color: Colors.white),),
            const SizedBox(height: 5,),
            BlocBuilder<FontsCubit , FontsState>(
              builder: (context , state) {
                final String currentFontFamily = fontsCubit.getCurrentFontFamily ;
                return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: fontFamiliesList.map((font) => GestureDetector(
                    onTap: (){
                      fontsCubit.changeFontFamily(font);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                        ),
                        color: currentFontFamily == font ? orangeColor : isDarkMode ? Colors.black54 : Colors.green.shade100,
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0 , vertical: 8),
                        child: Text(font),
                      )),
                    ),
                  )).toList()
                );
              }
            ) ,
          ],
        ),
      ),
    );
  }
}

