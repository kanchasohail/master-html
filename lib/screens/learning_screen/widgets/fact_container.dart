
import '../../../constants/consts.dart';

Widget factContainer({required String factText , required double fontSize , required String fontFamily , required Color containerColor , required Icon leadingIcon , required String leadingText}){
  return factText != "null" ? Container(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      color: containerColor,
      borderRadius: BorderRadius.circular(4)
    ),
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 12),
      child: Wrap(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leadingIcon,
          const SizedBox(width: 5),
          Text(leadingText , style: TextStyle(fontSize: fontSize + 3 , fontFamily: 'RobotoMedium' , color: const Color(0xffe6e6e6)),),
          // width: MediaQuery.of(context).orientation == Orientation.portrait ? deviceWidth - 90 : deviceWidth - 120 ,
          Padding(
            padding: const EdgeInsets.only(top: 5 ,left: 4.0 , right: 6 , bottom: 4),
            child: Text(factText , style: TextStyle(fontSize: fontSize ,fontFamily: fontFamily , color: const Color(0xffe3e3e3) ),),
          ),
        ],
      ),
    ),
  ) : const SizedBox();
}