

import '../../constants/consts.dart';
import '../../screens/settings_screen/settings_screen.dart';
import '../../screens/settings_screen/widgets/change_theme_button_widget.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: deviceWidth - deviceWidth / 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Let's Learn !"),
        ),
        body: SafeArea(
          child: Container(
            color: lightBlack,
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (ctx , index) => const ListTile(title: Text("Separated list items"), trailing: Icon(Icons.check_circle_outline),), separatorBuilder:  (ctx , index) => const Padding(
                        padding: EdgeInsets.only(left: 18.0),
                        child: Divider( height: 2, thickness: 1.0 ,),
                      ),itemCount: 20),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: const Text("Settings"),
                      trailing: const Icon(Icons.settings),
                      onTap: (){
                        Navigator.of(context).pushNamed(SettingScreen.routeName);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
