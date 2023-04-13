import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/cubits/profile_cubit/user_name_cubit.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';


import '../../constants/consts.dart';

class CertificateCubit extends Cubit<CertificateState> {
  CertificateCubit() : super(CertificateInitialState());
  final ScreenshotController screenshotController = ScreenshotController();


  //This method will capture the screenshot of the certificate
  Future<void> captureCertificateScreenshot(
      {required UserNameCubit userNameCubit,}) async {
    final Uint8List image = await screenshotController.captureFromWidget(
      SizedBox(
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
    );
    if (image.isEmpty) return;
   await saveCertificate(image);
  }

  //This method will save the certificate in gallery
 Future<String> saveCertificate(Uint8List bytes) async {
   final time = DateTime.now()
       .toIso8601String()
       .replaceAll('.', '-')
       .replaceAll(':', '-');
   final name = 'screenshot_$time';
   final result = await ImageGallerySaver.saveImage(bytes, name: name);
   // Fluttertoast.showToast(
   //     msg: "This Shayari downloaded",
   //     toastLength: Toast.LENGTH_SHORT,
   //     gravity: ToastGravity.CENTER,
   //     timeInSecForIosWeb: 1,
   //     backgroundColor: greyColor,
   //     textColor: Colors.white,
   //     fontSize: 16.0);
   return result['filepath'];
 }
}

//These are the states class for this cubit
abstract class CertificateState {}

class CertificateInitialState extends CertificateState {}
