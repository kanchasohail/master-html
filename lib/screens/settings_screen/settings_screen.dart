

import 'package:master_html/screens/settings_screen/widgets/change_theme_popup.dart';

import '../../constants/consts.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = "/setting-screen";

  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Settings",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              ListTile(
                title:  Text("Change Theme" , style: Theme.of(context).textTheme.bodyLarge,),
                trailing: const Icon(Icons.color_lens_outlined),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => const ChangeThemePopUp());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
