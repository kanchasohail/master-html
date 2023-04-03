import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/consts.dart';
import '../../../cubits/fonts_cubit/font_size_cubit.dart';

class FontSizeDropDownButton extends StatelessWidget {
  const FontSizeDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontSizeCubit = BlocProvider.of<FontSizeCubit>(context) ;
    return BlocBuilder<FontSizeCubit , FontSizeState>(
      builder: (context , state) {
        return DropdownButton(
          value: fontSizeCubit.getCurrentFontSize,
          items: fontSize
              .map((element) =>
              DropdownMenuItem(value: element, child: Text('$element px')))
              .toList(),
          onChanged: (value) {
            fontSizeCubit.changeFontSize(value ?? 18);
          },
          hint: const Text('Select a font size'),
        );
      }
    );
  }
}
