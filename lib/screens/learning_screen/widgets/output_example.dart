import 'package:flutter_html/flutter_html.dart';

import '../../../constants/consts.dart';

Widget outputExample ({required String codeExample}){
  return Padding(
    padding: const EdgeInsets.only(top: 6),
    child: Card(
      elevation: 4,
      color: Colors.white12,
      child: Html(
        data: codeExample,
      ),
    ),
  );
}