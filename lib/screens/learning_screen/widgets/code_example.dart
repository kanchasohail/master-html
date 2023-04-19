import 'package:master_html/common_widgets/custom_outlined_button.dart';

import '../../../constants/consts.dart';

Widget codeExample({required String codeExample, required VoidCallback onTap}) {
  if (codeExample != "null") {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 4,
            shadowColor: orangeColor,
            child: Text(codeExample),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14 , bottom: 8 , right: 8 , left: 8),
          child: customOutlinedButton(onPressed: onTap, buttonText: "Try it yourself"),
        )
      ],
    );
  } else {
    return const SizedBox();
  }
}
