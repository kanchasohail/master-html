import 'package:master_html/screens/settings_screen/widgets/change_theme_button_widget.dart';
import 'package:master_html/screens/settings_screen/widgets/header_container.dart';
import 'package:master_html/screens/settings_screen/widgets/my_list_tile.dart';

import '../../constants/consts.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = "/setting-screen";

  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          headerContainer(context: context, text: "App Theme"),
            myListTile(context: context, title: "Dark Mode" ,trailing: const ChangeThemeButtonWidget()),
            headerContainer(context: context, text: "Font"),
            myListTile(context: context, title: "Font size", trailing: DropdownButton(items: [], onChanged: (_){})),
            myListTile(context: context, title: "Font family", trailing: DropdownButton(items: [], onChanged: (_){})),
            headerContainer(context: context, text: "Contact us"),
            myListTile(context: context, title: "Follow us on twitter", trailing: const Icon(Icons.people_alt_sharp)),
            myListTile(context: context, title: "Rate us 5 stars", trailing: const Icon(Icons.tag_faces_sharp)),
          ],
        ),
      ),
    );
  }
}

