import '../../common_widgets/side_drawer/side_drawer.dart';
import '../../constants/consts.dart';
import '../code_screen/codes_main_screen.dart';
import '../settings_screen/widgets/change_theme_popup.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(
        title: const Text("Learn HTML"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text(
                "Welcome user , let's learn HTML !",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(CodesMainScreen.routeName);
                    },
                    child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width / 2.2,
                        margin: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          gradient: LinearGradient(
                            colors: [Color(0xfff9d423), Color(0xfff83600)],
                            begin: Alignment.topLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Center(
                            child: Text(
                              'Edit Code',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ))),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width / 2.2,
                        margin: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          gradient: LinearGradient(
                            colors: [Color(0xfff093fb), Color(0xfff5576c)],
                          ),
                        ),
                        child: Center(
                            child: Text(
                              'Play Quizes',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ))),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context, builder: (ctx) => const ChangeThemePopUp());
                  },
                  child: const Text("Change theme")),
            ],
          ),
        ),
      ),
    );
  }
}
