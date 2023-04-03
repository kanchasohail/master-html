import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/cubits/fonts_cubit/fonts_family_cubit.dart';

import '../../../constants/consts.dart';

class FontFamilyDropDownButton extends StatelessWidget {
  const FontFamilyDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontSizeCubit = BlocProvider.of<FontFamilyCubit>(context) ;
    return BlocBuilder<FontFamilyCubit , FontFamilyState>(
        builder: (context , state) {
          return DropdownButton(
            value: fontSizeCubit.getCurrentFontFamily,
            items: fontFamily
                .map((element) =>
                DropdownMenuItem(value: element, child: Text(element)))
                .toList(),
            onChanged: (value) {
              fontSizeCubit.changeFontFamily(value ?? 'Roboto');
            },
            hint: const Text('Select a font Family'),
          );
        }
    );
  }
}
