import 'dart:io';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/cubits/profile_cubit/profile_image_cubit.dart';

import '../../../constants/consts.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileImageCubit = BlocProvider.of<ProfileImageCubit>(context);
    return GestureDetector(
      onTap: () {
        profileImageCubit.changeImage();
      },
      child: BlocBuilder<ProfileImageCubit, ProfileImageState>(builder: (context, state) {
        return Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: profileImageCubit.profileImagePath == '' && profileImageCubit.profileImage == null
                    ? const AssetImage('assets/dark_bg.png')
                    : profileImageCubit.profileImagePath != '' && profileImageCubit.profileImage == null ? FileImage(File(profileImageCubit.profileImagePath))
                        as ImageProvider : MemoryImage(profileImageCubit.profileImage!),
                fit: BoxFit.cover),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: profileImageCubit.profileImagePath == '' && profileImageCubit.profileImage == null
                        ? Image.asset('assets/profile.jpeg')
                        : profileImageCubit.profileImagePath != '' && profileImageCubit.profileImage == null ? Image.file(File(profileImageCubit.profileImagePath)) : Image.memory(profileImageCubit.profileImage!)),
              ),
            ),
          ),
        );
      }),
    );
  }
}
