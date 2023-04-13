import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/cubits/certificate_cubit/certificate_cubit.dart';
import 'package:master_html/screens/profile_screen/widgets/certificate_image.dart';
import 'package:master_html/screens/profile_screen/widgets/profile_image.dart';
import 'package:master_html/screens/profile_screen/widgets/user_name_row.dart';

import '../../constants/consts.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-screen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Profile"),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileImage(),
              Padding(
                padding: const EdgeInsets.only(left: 11.0, top: 28),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                      child: Icon(Icons.info),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 80,
                      child: const Text(
                        "Choose a professional looking photo for your certificate",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    )
                  ],
                ),
              ),
              const UserNameRow(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  height: 1,
                  thickness: 1,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: BlocProvider(
                    create: (context) => CertificateCubit(),
                    child: const CertificateImage()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
