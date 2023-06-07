import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:master_html/common_widgets/custom_outlined_button.dart';
import 'package:master_html/cubits/codes_cubit/code_cubit.dart';

import '../../../constants/consts.dart';

Widget codeExample(
    {required String codeExample,
    required VoidCallback onTap,
    required bool isDarkMode,
    required double fontSize,
    required BuildContext ctx}) {
  if (codeExample != "null") {
    final CodeCubit codeCubit = BlocProvider.of<CodeCubit>(ctx);
    final bool isOneLinedCode = !codeExample.contains("<!DOCTYPE html>", 0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: Text(
            "Example -",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSize + 4,
                color: isDarkMode
                    ? const Color(0xffe6e6e6)
                    : const Color(0xff2C2C2C)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: SizedBox(
            width: double.infinity,
            child: BlocBuilder<CodeCubit, CodeState>(builder: (context, state) {
              return Card(
                elevation: 2,
                color: codeCubit.getCardColorAccordingToTheme(
                    isDarkMode: isDarkMode),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: BlocBuilder<CodeCubit, CodeState>(
                        builder: (context, state) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: HighlightView(codeExample,
                            textStyle: TextStyle(
                                height: 1.4,
                                fontWeight: isOneLinedCode
                                    ? FontWeight.w600
                                    : FontWeight.normal),
                            language: "html",
                            theme: codeCubit.getCurrentCodeTheme(
                                isDarkMode: isDarkMode),
                            padding: const EdgeInsets.all(8)),
                      );
                    })),
              );
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14, bottom: 8, right: 8, left: 8),
          child: customOutlinedButton(
              onPressed: onTap, buttonText: "Try it yourself"),
        )
      ],
    );
  } else {
    return const SizedBox();
  }
}
