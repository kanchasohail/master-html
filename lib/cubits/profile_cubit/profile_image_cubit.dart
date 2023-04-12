import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../constants/consts.dart';
import '../../main.dart';

//These Strings are related to shared preferences
const profileImageStringKey = 'profileImageKey';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  ProfileImageCubit() : super(ProfileImageInitialState()) {
    getImage();
  }

  String profileImagePath = '';
  Uint8List? profileImage;

  // Change Image method
  Future<void> changeImage() async {
    var status = await Permission.storage.status;
    if(status.isRestricted || status.isDenied || status.isPermanentlyDenied){
      await [Permission.storage].request();
    }
    try {
      final XFile? img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 100);
      if (img == null) return;
      final croppedImage =
          await cropImage(file: img, imageCropper: ImageCropper());
      profileImagePath = croppedImage?.path ?? img.path;
      final imageBytes = await File(profileImagePath).readAsBytes();
      saveImage(imageBytes);
    } catch (e) {
      debugPrint("Failed to update profile image");
    }
  }

//This method is for cropping image
  Future<CroppedFile?> cropImage({
    required XFile file,
    required ImageCropper imageCropper,
  }) async {
    return await imageCropper.cropImage(
        sourcePath: file.path,
        aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0));
  }

  //this method is for saving an Image
  void saveImage(List<int> imageBytes) async {
    String base64Image = base64Encode(imageBytes);
    pref.setString(profileImageStringKey, base64Image);
    profileImage = null;
    emit(ProfileImageChangeState());
  }

//this method is for getting the image
  void getImage() async {
    Uint8List bytes =
        base64Decode(pref.getString(profileImageStringKey) ?? "error");
    if (bytes.toString() == "error") {
      profileImagePath = '';
      profileImage = null;
    }
    // profileImage = Image.memory(bytes);
    profileImage = bytes;
  }
}

// These are the state class for this cubit
abstract class ProfileImageState {}

class ProfileImageInitialState extends ProfileImageState {}

class ProfileImageChangeState extends ProfileImageState {}
