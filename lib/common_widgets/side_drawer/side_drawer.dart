import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/cubits/lesson_cubit/lesson_cubit.dart';
import 'package:master_html/resources/lists/lessons_list.dart';
import 'package:master_html/screens/learning_screen/learning_screen.dart';

import '../../constants/consts.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final List<String> completedLessons =
        BlocProvider.of<LessonCubit>(context).getListOfCompletedLessons();
    return SizedBox(
      width: deviceWidth - deviceWidth / 5.5,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const FittedBox(child: Text("HTML Lessons")),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 7.0, top: 7.5, bottom: 7.5),
              child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: orangeColor),
                      foregroundColor: Colors.orange ,
                    padding: const EdgeInsets.only(left: 18 , right:20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22)
                    )
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  icon: const Icon(
                    Icons.home,
                    color: orangeColor,
                    size: 26,
                  ),
                  label: Text(
                    "Home",
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodySmall?.color),
                  )),
            )
          ],
        ),
        body: SafeArea(
          child: Container(
            color: Theme.of(context).drawerTheme.backgroundColor,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowIndicator();
                return true;
              },
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final bool isCompleted =
                      completedLessons.contains(AllLessonsList[index]);
                  return ListTile(
                    onTap: () {
                      // Navigator.of(context)
                      //     .popUntil((route) => route.);
                      // Navigator.of(context).pushNamed(
                      //     LearningScreen.routeName,
                      //     arguments: AllLessonsList[index]);
                      // Navigator.of(context).popAndPushNamed(
                      //     LearningScreen.routeName,
                      //     arguments: AllLessonsList[index]);

                      Navigator.of(context).pop();
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.of(context).pushNamed(LearningScreen.routeName,
                          arguments: AllLessonsList[index]);
                    },
                    title: Text(
                      AllLessonsList[index],
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    trailing: isCompleted
                        ? const Icon(Icons.check_circle_outline,
                            color: orangeColor, size: 22)
                        : const Icon(Icons.circle_outlined,
                            color: darkBodyColor, size: 22),
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
                itemCount: AllLessonsList.length,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
