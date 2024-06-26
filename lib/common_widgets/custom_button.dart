import '../constants/consts.dart';

Widget customButton({required String text , required Color backgroundColor ,required BuildContext context , required VoidCallback onPressed}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        visualDensity: const VisualDensity(
          vertical: 2,
        ),
        padding: const EdgeInsets.symmetric(vertical: 6.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24)
        ),
        backgroundColor: backgroundColor),
    onPressed: onPressed,
    child: Text(
      text,
      style: Theme.of(context).textTheme.bodySmall,
    ),
  );
}