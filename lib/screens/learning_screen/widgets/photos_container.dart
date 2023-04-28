import '../../../constants/consts.dart';

Widget photosContainer(String photoName){
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Card(
      elevation: 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
          clipBehavior: Clip.antiAlias,
          child: Image.asset("assets/lesson_photos/$photoName.jpg")),
    ),
  );
}