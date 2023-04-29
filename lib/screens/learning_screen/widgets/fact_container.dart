
import '../../../constants/consts.dart';

Widget factContainer({required String factText , required double fontSize , required String fontFamily , required Color containerColor , required Icon leadingIcon , required String leadingText}){
  return factText != "null" ? Container(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    color: containerColor,
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 12),
      child: Wrap(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leadingIcon,
          const SizedBox(width: 5),
          Text(leadingText , style: TextStyle(fontSize: fontSize + 3 , fontWeight: FontWeight.bold),),
          // width: MediaQuery.of(context).orientation == Orientation.portrait ? deviceWidth - 90 : deviceWidth - 120 ,
          Padding(
            padding: const EdgeInsets.only(left: 4.0 , right: 6 , bottom: 4),
            child: Text(factText , style: TextStyle(fontSize: fontSize ,fontFamily: fontFamily ),),
          ),
        ],
      ),
    ),
  ) : const SizedBox();
}