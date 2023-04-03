import '../../../constants/consts.dart';

Widget itemCard({required BuildContext context , required String text , required Icon iconWidget , required VoidCallback onTap}){
  return GestureDetector(
    onTap: onTap,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style:
                  Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,

                ),
                const SizedBox(
                  height: 5,
                ),
                iconWidget
              ],
            )),
      ),
    ),
  );
}