import '../../../constants/consts.dart';

Widget photosContainer(String photoName){
  return ClipRRect(
    borderRadius: BorderRadius.circular(4),
      clipBehavior: Clip.antiAlias,
      child: Image.asset("assets/lesson_photos/$photoName.jpg"));
}