import '../../../constants/consts.dart';

Widget backConfirmationDialogue({required BuildContext context}) {
  return AlertDialog(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    actions: [
      TextButton(
          onPressed: () => Navigator.pop(context, false),
          style: ButtonStyle(
            overlayColor: MaterialStateColor.resolveWith(
                (states) => Theme.of(context).cardTheme.color!),
          ),
          child: const Text(
            "Cancel",
            style: TextStyle(
                color: orangeColor, fontWeight: FontWeight.bold, fontSize: 16),
          )),
      TextButton(
          onPressed: () => Navigator.pop(context, true),
          style: ButtonStyle(
            overlayColor: MaterialStateColor.resolveWith(
                (states) => Theme.of(context).cardTheme.color!),
          ),
          child: const Text(
            "Quit",
            style: TextStyle(
                color: orangeColor, fontWeight: FontWeight.bold, fontSize: 16),
          )),
    ],
    alignment: Alignment.center,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    content: SizedBox(
      height: 80,
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Text(
            "Exit Quiz",
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontSize: 22),
          ),
          const SizedBox(height: 10),
          Text(
            "Progress won't be saved if you exist the quiz!",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    ),
  );
}
