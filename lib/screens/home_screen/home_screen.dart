import 'package:master_html/screens/home_screen/widgets/facebook_community_widget.dart';
import 'package:master_html/screens/home_screen/widgets/faq_card.dart';
import 'package:master_html/screens/home_screen/widgets/item_cards.dart';
import 'package:master_html/screens/home_screen/widgets/progress_widget_row.dart';
import 'package:master_html/screens/learning_screen/learning_screen.dart';
import 'package:master_html/screens/profile_screen/profile_screen.dart';
import 'package:master_html/screens/settings_screen/settings_screen.dart';

import '../../common_widgets/side_drawer/side_drawer.dart';
import '../../constants/consts.dart';
import '../code_screen/codes_main_screen.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:device_info_plus/device_info_plus.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key , required this.isGetStarted}) : super(key: key);
  final bool isGetStarted ;

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return TooltipVisibility(
      visible: false,
      child: Scaffold(
        drawer: const SideDrawer(),
        appBar: AppBar(
          title: const Text("Master HTML"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: orangeColor,
                child: IconButton(
                  splashRadius: 25 ,
                    onPressed: () {
                      Navigator.of(context).pushNamed(ProfileScreen.routeName);
                    },
                    icon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    )),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowIndicator();
              return true ;
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Center(
                child: Column(
                  children: [
                    const ProgressWidgetRow(),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GridView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 40,
                            childAspectRatio: isPortrait ? 1.32 : 3.9),
                        children: [
                          itemCard(
                              context: context,
                              text: isGetStarted ? 'Get Stated' : 'Continue Learning',
                              iconWidget: const Icon(Icons.arrow_forward),
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(LearningScreen.routeName);
                              }),
                          itemCard(
                              context: context,
                              text: 'Code Editor',
                              iconWidget: const Icon(Icons.code_sharp),
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(CodesMainScreen.routeName);
                              }),
                          itemCard(
                              context: context,
                              text: 'Report a bug or issue',
                              iconWidget: const Icon(Icons.bug_report_sharp),
                              onTap: _reportViaEmail),
                          //Settings card
                          GestureDetector(
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
                    facebookCommunityWidget(),
                    const FaqCard()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _reportViaEmail() async {
  final deviceInfoPlugin = DeviceInfoPlugin();
  final deviceInfo = await deviceInfoPlugin.deviceInfo;
  final allInfo = deviceInfo.data;
  final String deviceInformation = '''
  
App name = Master HTML 
App version = 1.0.3   

Device name = ${allInfo['product']}        
Device Manufacturer = ${allInfo['manufacturer']}
                            
Device info = ${allInfo['fingerprint']}''';
  String email = Uri.encodeComponent("thegeniuscoder100@gmail.com");
  String subject =
      Uri.encodeComponent("Report a bug or issue - TheGeniusCoder");
  String body = Uri.encodeComponent(
      "Thank you for reaching out to us! Please do not remove these details down below. It helps us understand the issue you are facing. \n$deviceInformation \n\nDescribe you issue in brief - ");
  Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
  if (await launchUrl(mail)) {
    //email app opened
  } else {
    //email app is not opened
  }
}
