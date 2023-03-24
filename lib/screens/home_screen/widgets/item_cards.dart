import '../../../constants/consts.dart';

Widget itemCard({required BuildContext context , required String text , required Icon iconWidget , required VoidCallback onTap}){
  return InkWell(
    onTap: onTap,
    child: SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width / 2.5,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style:
                    Theme.of(context).textTheme.bodyLarge,
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
    ),
  );
}