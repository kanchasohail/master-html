import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:master_html/common_widgets/snack_bar.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '../../constants/consts.dart';

class CertificateCubit extends Cubit<CertificateState> {
  CertificateCubit() : super(CertificateInitialState());

  // WidgetsToImageController to access widget
  WidgetsToImageController widgetsToImageController =
      WidgetsToImageController();

  // to save image bytes of widget
  Uint8List? bytes;

//This method will capture the certificateWidget and convert it into image
  Future<Uint8List?> captureCertificateWidget(
      {required BuildContext context}) async {
    final imageBytes = await widgetsToImageController.capture();
    bytes = imageBytes;
    if (bytes == null) return null;
    await saveCertificate(bytes!).then((val) {
      if (val.isNotEmpty) {
        showSnackBar(
            ctx: context,
            messageText: "Certificate downloaded successfully!",
            bgColor: greenColor);
      } else {
        showSnackBar(
            ctx: context,
            messageText: "Failed to save Certificate!",
            bgColor: redColor);
      }
      return "_";
    });
    return bytes;
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

  //This method will share the certificate
  Future<void> saveAndShareCertificate({required BuildContext context}) async {
    late final Uint8List imageBytes;
    final directory =
        await getApplicationDocumentsDirectory().then((val) async {
      imageBytes = (await captureCertificateWidget(context: context))!;
      return val;
    });
    final image = File('${directory.path}/certificate.png');
    image.writeAsBytesSync(imageBytes);
    const text =
        'I am excited to share that I got a certificate for learning HTML from this app.\nIf you also want to learn HTML from your phone, then download this app from here - (link)';
    await Share.shareXFiles([XFile(image.path)], text: text);
  }
}

//These are the states class for this cubit
abstract class CertificateState {}

class CertificateInitialState extends CertificateState {}
