import '../../../constants/consts.dart';

Widget codeExample({required String codeExample, required VoidCallback onTap}) {
  if (codeExample != "null") {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 8,
            shadowColor: orangeColor,
            child: Text(codeExample),
          ),
        ),
        InkWell(
          onTap: onTap,
          // Navigator.of(context).pushNamed(CodesMainScreen.routeName , arguments: element.codeExample);
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Try it yourself",
                  style: TextStyle(
                      color: orangeColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                )
              ],
            ),
          ),
        ),
      ],
    );
  } else {
    return const SizedBox();
  }
}
