import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:master_html/common_widgets/custom_outlined_button.dart';
import 'package:master_html/cubits/codes_cubit/code_cubit.dart';

import '../../../constants/consts.dart';

Widget codeExample(
    {required String codeExample,
    required VoidCallback onTap,
    required BuildContext ctx}) {
  if (codeExample != "null") {
    final CodeCubit codeCubit = BlocProvider.of<CodeCubit>(ctx);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: SizedBox(
            width: double.infinity,
            child: FittedBox(
              child: Card(
                elevation: 2,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: BlocBuilder<CodeCubit, CodeState>(
                        builder: (context, state) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: HighlightView(codeExample,
                            textStyle: const TextStyle(height: 1.4),
                            language: "html",
                            theme: codeCubit.getCurrentCodeTheme(),
                            padding: const EdgeInsets.all(8)),
                      );
                    })),
              ),
            ),
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
