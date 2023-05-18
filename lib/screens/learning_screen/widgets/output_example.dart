import 'package:flutter_html/flutter_html.dart';

import '../../../constants/consts.dart';

Widget outputExample ({required String codeExample , required double fontSize}){
  return Padding(
    padding: const EdgeInsets.only(top: 6),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0 , vertical: 8),
          child: Text("Example Output -" , style: TextStyle(fontWeight: FontWeight.bold , fontSize:  fontSize + 5),),
        ),
        Card(
          elevation: 4,
          color: const Color(0xffdbdbdb),
          child: Padding(
            padding: const EdgeInsets.only(left: 8 , right: 8 , bottom: 18 , top: 8),
            child: Html(
              style: {
                "body": Style(
                  color: Colors.black
                ),
              },
              data: codeExample,
            ),
          ),
        ),
      ],
    ),
  );
}