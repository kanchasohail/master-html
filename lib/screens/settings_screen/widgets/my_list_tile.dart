import '../../../constants/consts.dart';

Widget myListTile({required BuildContext context ,required String title ,  required Widget trailing }){
  return ListTile(
    title: Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    trailing: trailing,
  );
}