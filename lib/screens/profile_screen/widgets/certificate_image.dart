import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/common_widgets/custom_button.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '../../../constants/consts.dart';
import '../../../cubits/certificate_cubit/certificate_cubit.dart';
import '../../../cubits/profile_cubit/profile_image_cubit.dart';
import '../../../cubits/profile_cubit/user_name_cubit.dart';

class CertificateImage extends StatelessWidget {
  const CertificateImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userNameCubit = BlocProvider.of<UserNameCubit>(context);
    final certificateCubit = BlocProvider.of<CertificateCubit>(context);
    final profileImageCubit = BlocProvider.of<ProfileImageCubit>(context);
    return Column(
      children: [
        WidgetsToImage(
          controller: certificateCubit.widgetsToImageController,
          child: Container(
            height: 270,
            width: 380,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/certificate.png'),
                    fit: BoxFit.fill)),
            // child: Align(
            //   alignment: AlignmentDirectional.centerStart,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 16, bottom: 20),
            //     child: BlocBuilder<UserNameCubit, UserNameState>(
            //         builder: (context, state) {
            //       return Text(
            //         userNameCubit.userName ?? "",
            //         style: const TextStyle(
            //             color: orangeColor,
            //             fontStyle: FontStyle.italic,
            //             fontSize: 22),
            //       );
            //     }),
            //   ),
            // ),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 20),
                    child: BlocBuilder<UserNameCubit, UserNameState>(
                        builder: (context, state) {
                      return Text(
                        userNameCubit.userName ?? "",
                        style: const TextStyle(
                            color: orangeColor,
                            fontStyle: FontStyle.italic,
                            fontSize: 22),
                      );
                    }),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: BlocBuilder<ProfileImageCubit, ProfileImageState>(
                        builder: (context, state) {
                          return SizedBox(
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: profileImageCubit.profileImagePath == '' && profileImageCubit.profileImage == null
                                    ? Image.asset('assets/profile.jpeg')
                                    : profileImageCubit.profileImagePath != '' && profileImageCubit.profileImage == null ? Image.file(File(profileImageCubit.profileImagePath)) : Image.memory(profileImageCubit.profileImage!)),
                          );
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: customButton(
                  text: "Save",
                  backgroundColor: orangeColor,
                  context: context,
                  onPressed: () {
                    certificateCubit.captureCertificateWidget(context: context);
                  }),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: customButton(
                  text: "Share",
                  backgroundColor: orangeColor,
                  context: context,
                  onPressed: () {
                    certificateCubit.saveAndShareCertificate(context: context);
                  }),
            ),
          ],
        )
      ],
    );
  }
}
