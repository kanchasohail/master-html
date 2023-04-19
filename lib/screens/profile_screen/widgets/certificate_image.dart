import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/common_widgets/custom_button.dart';

import '../../../constants/consts.dart';
import '../../../cubits/certificate_cubit/certificate_cubit.dart';
import '../../../cubits/profile_cubit/user_name_cubit.dart';


class CertificateImage extends StatelessWidget {
  const CertificateImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userNameCubit = BlocProvider.of<UserNameCubit>(context);
    final certificateCubit = BlocProvider.of<CertificateCubit>(context);
    return Column(
      children: [
        SizedBox(
          height: 250,
          width: 420,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/certificate.png',
                fit: BoxFit.cover,
              ),
              Align(
                alignment: const Alignment(-0.72, -0.08),
                child: BlocBuilder<UserNameCubit, UserNameState>(
                    builder: (context, state) {
                  return Text(
                    userNameCubit.userName ?? "Your Name",
                    style: const TextStyle(
                        fontFamily: 'Alkatra', color: Colors.deepPurple),
                  );
                }),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: customButton(text: "Save", backgroundColor: orangeColor, context: context, onPressed: (){
                certificateCubit.captureCertificateScreenshot(userNameCubit: userNameCubit , context: context);
              }),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: customButton(text: "Share", backgroundColor: orangeColor, context: context, onPressed: (){
                certificateCubit.saveAndShareCertificate(userNameCubit: userNameCubit , context:  context);
              }),
            ),
          ],
        )
      ],
    );
  }
}
