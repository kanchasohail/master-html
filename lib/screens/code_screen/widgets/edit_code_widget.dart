import 'package:code_text_field/code_text_field.dart';

import '../../../constants/consts.dart';

class EditCodeWidget extends StatelessWidget {
  const EditCodeWidget(this.controller, this._textTheme, {Key? key}) : super(key: key);
  final CodeController controller;

  final Map<String, TextStyle> _textTheme;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CodeTheme(
        data: CodeThemeData(styles: _textTheme),
        child: SingleChildScrollView(
          child: CodeField(
            controller: controller,
          ),
        ),
      ),
    );
  }
}
