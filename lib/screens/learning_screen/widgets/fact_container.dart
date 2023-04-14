

import '../../../constants/consts.dart';

Widget factContainer({required String factText  , required BuildContext context , required double fontSize , required String fontFamily}){
  return factText != "null" ? Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
        color: Colors.blueAccent.shade700,
        borderRadius: BorderRadius.circular(2)
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.lightbulb_outlined , size: 20),
        const SizedBox(width: 5),
        SizedBox(
            width: MediaQuery.of(context).size.width - 90,
            child: Text(factText , style: TextStyle(fontSize: fontSize ,fontFamily: fontFamily ),)),
      ],
    ),
  ) : const SizedBox();
}