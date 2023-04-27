import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/cubits/codes_cubit/code_cubit.dart';


class WrapCodeSwitch extends StatelessWidget {
  const WrapCodeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final codeCubit = BlocProvider.of<CodeCubit>(context);
    return Transform.scale(
      scale: 0.9,
      child: BlocBuilder<CodeCubit, CodeState>(
        builder: (context, state) {
          final bool isOn = codeCubit.getWrapCodeCurrentSetting();
          if (isOn) {
            return CupertinoSwitch(
                activeColor: CupertinoColors.activeOrange,
                value: true,
                onChanged: (value) {
                  codeCubit.changeWrapCodeSetting(value);
                });
          } else {
            return CupertinoSwitch(
                value: false,
                onChanged: (value) {
                  codeCubit.changeWrapCodeSetting(value);
                });
          }
        },
      ),
    );
  }
}
