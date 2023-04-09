
import 'package:master_html/resources/lists/lessons_list.dart';
import 'package:master_html/screens/learning_screen/learning_screen.dart';

import '../../constants/consts.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return SizedBox(
        width: deviceWidth - deviceWidth / 5,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: AppBar(
              automaticallyImplyLeading: false,
              title: const Text("HTML Lessons"),
            ),
          ),
          body: SafeArea(
            child: Container(
              color: Theme.of(context).drawerTheme.backgroundColor,
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowIndicator();
                  return true ;
                },
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: (){
                        Navigator.of(context).popAndPushNamed(LearningScreen.routeName , arguments:lessonsList[index] );
                      },
                      title: Text(lessonsList[index] , style: const TextStyle(fontSize: 16 , fontWeight: FontWeight.w400),),
                      trailing: index % 2 == 0 ? const Icon(Icons.check_circle_outline , color: orangeColor,) : const Icon(Icons.circle_outlined , color: darkBodyColor,),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Divider(
                        height: 2,
                        thickness: 1,
                      ),
                    );
                  },
                  itemCount: lessonsList.length,
                ),
              ),
            ),
          ),
        ));
  }
}
