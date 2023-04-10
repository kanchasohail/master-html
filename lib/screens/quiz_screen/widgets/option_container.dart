import 'package:master_html/screens/quiz_screen/widgets/rounded_checkbox.dart';

import '../../../constants/consts.dart';

Widget optionContainer(
    {required BuildContext context,
    required bool isChecked,
    required String text,
    required VoidCallback onTap}) {
  final bool isPortraitMode =
      MediaQuery.of(context).orientation == Orientation.portrait;
  final deviceWidth = MediaQuery.of(context).size.width;
  return InkWell(
    borderRadius: BorderRadius.circular(4),
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          roundedCheckBox(value: isChecked, onChanged: onTap),
          SizedBox(
            width: isPortraitMode ? deviceWidth - 120 : deviceWidth - 150,
            child: Text(
              text,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    ),
  );
}
