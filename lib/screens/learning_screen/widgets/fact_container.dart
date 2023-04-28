
import '../../../constants/consts.dart';

Widget factContainer({required String factText  , required BuildContext context , required double fontSize , required String fontFamily}){
  final deviceWidth = MediaQuery.of(context).size.width ;
  return factText != "null" ? Container(
    color: const Color(0xff0A272F),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text("Interesting Fact -" , style: TextStyle(fontSize: fontSize + 3 , fontWeight: FontWeight.bold),),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.lightbulb_outlined , size: 20),
            const SizedBox(width: 5),
            SizedBox(
                // width: MediaQuery.of(context).size.width - 90,
                width: MediaQuery.of(context).orientation == Orientation.portrait ? deviceWidth - 90 : deviceWidth - 120 ,
                child: Text(factText , style: TextStyle(fontSize: fontSize ,fontFamily: fontFamily ),)),
          ],
        ),
      ],
    ),
  ) : const SizedBox();
}