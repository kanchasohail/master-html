import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/cubits/fonts_cubit/fonts_cubit.dart';

import '../../../constants/consts.dart';

class FontFamilyDropDownButton extends StatelessWidget {
  const FontFamilyDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontsCubit = BlocProvider.of<FontsCubit>(context) ;
    return BlocBuilder<FontsCubit , FontsState>(
        builder: (context , state) {
          return DropdownButton(
            value: fontsCubit.getCurrentFontFamily,
            items: fontFamiliesList
                .map((element) =>
                DropdownMenuItem(value: element, child: Text(element)))
                .toList(),
            onChanged: (value) {
              fontsCubit.changeFontFamily(value ?? 'Roboto');
            },
            hint: const Text('Select a font Family'),
          );
        }
    );
  }
}
