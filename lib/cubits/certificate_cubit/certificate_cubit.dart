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
      {required UserNameCubit userNameCubit, required BuildContext context}) async {
    final Uint8List image = await screenshotController.captureFromWidget(
      SizedBox(
        height: 310,
        child: Stack(
          children: [
            Image.asset(
              'assets/certificate.png',
              fit: BoxFit.cover,
            ),
            Align(
              alignment: const Alignment(-0.85, -0.08),
              child: Text(userNameCubit.userName ?? "Your Name" ,style: const TextStyle(
                  fontFamily: 'Alkatra', color: Colors.deepPurple ,fontSize: 26),),
            ),
          ],
        ),
      ),
    );
    if (image.isEmpty) return;
   await saveCertificate(image).then((val) {
     if(val.isNotEmpty){
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Certificate downloaded successfully!" , style: TextStyle(fontWeight: FontWeight.w600 , color: Colors.white),) , backgroundColor: Colors.green,));
     }else{
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Failed to save Certificate!" , style: TextStyle(fontWeight: FontWeight.w600 , color: Colors.white),) , backgroundColor: Colors.red,));
     }
     return "_";
   });

  }

  //This method will save the certificate in gallery
 Future<String> saveCertificate(Uint8List bytes) async {
   final time = DateTime.now()
       .toIso8601String()
       .replaceAll('.', '-')
       .replaceAll(':', '-');
   final name = 'screenshot_$time';
   final result = await ImageGallerySaver.saveImage(bytes, name: name);
   return result['filePath'];
 }
}

//These are the states class for this cubit
abstract class CertificateState {}

class CertificateInitialState extends CertificateState {}
