import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/cubits/fonts_cubit/font_size_cubit.dart';

import '../../../constants/consts.dart';

class FontChangingCard extends StatelessWidget {
  const FontChangingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontSizeCubit = BlocProvider.of<FontSizeCubit>(context);
    return  Card(
      elevation: 8,
      color: Colors.blueGrey,
      shadowColor: Colors.blue,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Font Size"),
                BlocBuilder<FontSizeCubit , FontSizeState>(
                  builder: (context , state) {
                    return Row(
                      children: [
                        IconButton(onPressed: fontSizeCubit.isLeastSize   ?  null :  (){
                          fontSizeCubit.decrementFontSize(fontSizeCubit.getCurrentFontSize);
                        }, icon: const Icon(CupertinoIcons.minus) , splashRadius: 22,),
                         Text(fontSizeCubit.getCurrentFontSize.toString()),
                        IconButton(onPressed: fontSizeCubit.isHighestSize ?null : (){
                          fontSizeCubit.incrementFontSize(fontSizeCubit.getCurrentFontSize);
                        }, icon: const Icon(CupertinoIcons.plus), splashRadius: 22,),
                      ],
                    );
                  }
                )

              ],
            ),
            const SizedBox(height: 10,),
            const Text("Font family"),
            Wrap(
              children: const [
                Card(child: Text("Font family"),),
                Card(child: Text("Font family"),),
                Card(child: Text("Font family"),),
                Card(child: Text("Font family"),),
                Card(child: Text("Font family"),),
                Card(child: Text("Font family"),),
              ],
            ) ,
          ],
        ),
      ),
    );
  }
}

