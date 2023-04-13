import '../../../constants/consts.dart';

Widget myListTile({required BuildContext context ,required String title ,  required Widget trailing  , required VoidCallback onTap}){
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: trailing,
      ),
    ),
  );
}