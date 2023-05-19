import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/common_widgets/custom_button.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '../../../common_widgets/snack_bar.dart';
import '../../../constants/consts.dart';
import '../../../cubits/certificate_cubit/certificate_cubit.dart';
import '../../../cubits/lesson_cubit/lesson_cubit.dart';
import '../../../cubits/profile_cubit/profile_image_cubit.dart';
import '../../../cubits/profile_cubit/user_name_cubit.dart';
import '../../../resources/lists/lessons_list.dart';

class CertificateImage extends StatelessWidget {
  const CertificateImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userNameCubit = BlocProvider.of<UserNameCubit>(context);
    final certificateCubit = BlocProvider.of<CertificateCubit>(context);
    final profileImageCubit = BlocProvider.of<ProfileImageCubit>(context);
    final int allLessonsCount = AllLessonsList.length;
    final int completedLessonsCount = BlocProvider.of<LessonCubit>(context)
        .getListOfCompletedLessons()
        .length;
    final double percentage = completedLessonsCount / allLessonsCount * 100;
    final bool showCertificate = percentage >= 2 &&
        (profileImageCubit.profileImage != null &&
            userNameCubit.userName != null);

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
                            child: profileImageCubit.profileImagePath == '' &&
                                    profileImageCubit.profileImage == null
                                ? Image.asset('assets/profile.jpeg')
                                : profileImageCubit.profileImagePath != '' &&
                                        profileImageCubit.profileImage == null
                                    ? Image.file(File(
                                        profileImageCubit.profileImagePath))
                                    : Image.memory(
                                        profileImageCubit.profileImage!)),
                      );
                    }),
                  ),
                ),
                if (!showCertificate) ...[
                  SizedBox(
                      height: 270,
                      width: 380,
                      child: Image.asset('assets/locked_watermark.png',
                          fit: BoxFit.cover)),
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: IconButton(
                        onPressed: () {
                          final smallTextTheme =
                              Theme.of(context).textTheme.bodySmall;
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          style: ButtonStyle(
                                            overlayColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) =>
                                                        Theme.of(context)
                                                            .cardTheme
                                                            .color!),
                                          ),
                                          child: const Text(
                                            "Ok",
                                            style: TextStyle(
                                                color: orangeColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          )),
                                    ],
                                    alignment: Alignment.center,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    content: SizedBox(
                                      height: 186,
                                      width: 100,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.all(6.0),
                                                child: Icon(
                                                  Icons.info,
                                                  size: 30,
                                                ),
                                              ),
                                              Text(
                                                "Info",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineLarge,
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Complete 100% on learning progress to receive your certificate.\n",
                                            style: smallTextTheme,
                                          ),
                                          Text(
                                            "Enter your name and set a profile image.\n",
                                            style: smallTextTheme,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              useSafeArea: true);
                        },
                        icon: const Icon(
                          Icons.info_outline,
                          size: 40,
                        )),
                  ))
                ]
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
                  backgroundColor: showCertificate ? orangeColor : Colors.grey,
                  context: context,
                  onPressed: !showCertificate
                      ? () {
                          showSnackBar(
                              ctx: context,
                              messageText:
                                  "Complete all the lessons to unlock the certificate!",
                              bgColor: orangeColor);
                        }
                      : () {
                          certificateCubit.captureCertificateWidget(
                              context: context);
                        }),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: customButton(
                  text: "Share",
                  backgroundColor: showCertificate ? orangeColor : Colors.grey,
                  context: context,
                  onPressed: !showCertificate
                      ? () {
                          showSnackBar(
                              ctx: context,
                              messageText:
                                  "Complete all the lessons to unlock the certificate!",
                              bgColor: orangeColor);
                        }
                      : () {
                          certificateCubit.saveAndShareCertificate(
                              context: context);
                        }),
            ),
          ],
        )
      ],
    );
  }
}
