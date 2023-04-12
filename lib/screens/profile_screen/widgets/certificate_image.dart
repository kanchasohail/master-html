import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';

import '../../../constants/consts.dart';
import '../../../cubits/profile_cubit/user_name_cubit.dart';


class CertificateImage extends StatelessWidget {
  const CertificateImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userNameCubit = BlocProvider.of<UserNameCubit>(context);
    final ScreenshotController screenshotController = ScreenshotController();
    return InkWell(
      onTap: () async {
        final Uint8List image = await screenshotController.captureFromWidget(
          Center(
            child: SizedBox(
              height: 250,
              width: 420,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/certificate.png',
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: const Alignment(-0.85, -0.08),
                    child: Text(userNameCubit.userName ?? "Your Name"),
                  ),
                ],
              ),
            ),
          ),
        );
        if (image.isEmpty) return;
        // await saveImage(image);'
      },
      child: Center(
        child: SizedBox(
          height: 250,
          width: 420,
          child: Stack(
            children: [
              Image.asset(
                'assets/certificate.png',
                fit: BoxFit.cover,
              ),
              Align(
                alignment: const Alignment(-0.85, -0.08),
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
      ),
    );
  }
}
