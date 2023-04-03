import '../../constants/consts.dart';
import '../../screens/settings_screen/settings_screen.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: deviceWidth - deviceWidth / 5,
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
                      itemBuilder: (ctx, index) =>  ListTile(
                            title: const Text("Separated list items" , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w400),),
                            trailing: index % 2 == 0 ? const Icon(Icons.check_circle_outline) : const Icon(Icons.circle_outlined , color: darkBodyColor,),
                          ),
                      separatorBuilder: (ctx, index) => const Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Divider(
                              height: 2,
                              thickness: 1.0,
                            ),
                          ),
                      itemCount: 20),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: const Text("Settings"),
                      trailing: const Icon(Icons.settings),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(SettingScreen.routeName);
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
