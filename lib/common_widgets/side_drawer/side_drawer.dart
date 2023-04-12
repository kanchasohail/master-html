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
    final List<String> completedLessons = BlocProvider.of<LessonCubit>(context).getListOfCompletedLessons();
    return SizedBox(
        width: deviceWidth - deviceWidth / 5,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("HTML Lessons"),
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
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final bool isCompleted = completedLessons.contains(AllLessonsList[index]) ;
                    return ListTile(
                      onTap: (){
                        Navigator.of(context).popAndPushNamed(LearningScreen.routeName , arguments:AllLessonsList[index] );
                      },
                      title: Text(AllLessonsList[index] , style: const TextStyle(fontSize: 15 , fontWeight: FontWeight.w400),),
                      trailing: isCompleted ? const Icon(Icons.check_circle_outline , color: orangeColor, size: 22) : const Icon(Icons.circle_outlined , color: darkBodyColor, size: 22),
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
        ));
  }
}