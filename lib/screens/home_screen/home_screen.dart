import 'package:master_html/screens/home_screen/widgets/item_cards.dart';
import 'package:master_html/screens/settings_screen/settings_screen.dart';

import '../../common_widgets/side_drawer/side_drawer.dart';
import '../../constants/consts.dart';
import '../code_screen/codes_main_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(
        title: const Text("Learn HTML"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Text(
                  "Welcome user , let's learn HTML !",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 50,
                        childAspectRatio: isPortrait ? 1.4 : 4),
                    children: [
                      itemCard(
                          context: context,
                          text: 'Continue Learning',
                          iconWidget: const Icon(Icons.arrow_forward),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(CodesMainScreen.routeName);
                          }),
                      itemCard(
                          context: context,
                          text: 'Join Community',
                          iconWidget: const Icon(Icons.people_alt_sharp),
                          onTap: () {}),
                      itemCard(
                          context: context,
                          text: 'Report a bug or issue',
                          iconWidget: const Icon(Icons.bug_report_sharp),
                          onTap: () {}),
                      //Settings card
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(SettingScreen.routeName);
                        },
                        child: SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.settings),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Settings',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
