import '../../../constants/consts.dart';

Widget myListTile({required BuildContext context ,required String title ,  required Widget trailing  , required VoidCallback onTap}){
  return ListTile(
    onTap: onTap,
    title: Text(
      title,
      style: Theme.of(context).textTheme.bodyMedium,
    ),
    trailing: trailing,
  );
}