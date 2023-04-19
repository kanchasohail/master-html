import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/consts.dart';
import '../../../cubits/fonts_cubit/fonts_cubit.dart';

class FontSizeDropDownButton extends StatelessWidget {
  const FontSizeDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontSizeCubit = BlocProvider.of<FontsCubit>(context) ;
    return BlocBuilder<FontsCubit , FontsState>(
      builder: (context , state) {
        return DropdownButton(
          value: fontSizeCubit.getCurrentFontSize,
          items: fontSizesList
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
