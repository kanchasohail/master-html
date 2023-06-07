import 'package:code_text_field/code_text_field.dart';

import '../../../constants/consts.dart';

class EditCodeWidget extends StatelessWidget {
  const EditCodeWidget(
      {required this.controller,
      required this.textTheme,
      required this.isWrapOn,
      Key? key})
      : super(key: key);
  final CodeController controller;

  final Map<String, TextStyle> textTheme;
  final bool isWrapOn;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CodeTheme(
        data: CodeThemeData(styles: textTheme),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Scrollbar(
                child: CodeField(
                  wrap: isWrapOn,
                  textStyle: const TextStyle(height: 1.4),
                  controller: controller,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
