import 'package:webview_flutter/webview_flutter.dart';

import '../../../constants/consts.dart';

class ResultWidget extends StatelessWidget {
  ResultWidget(this._controller, this.loadLocalHtml, this.htmlCode,
      {super.key});

  final WebViewController _controller;
  final Function loadLocalHtml;

  final String htmlCode;
  late final String finalCode;

  //This method will add the view port so that the content get zoomed
  void addViewPort(String htmlCode) {
    if (!htmlCode.contains(RegExp(r'<head[\s\S]*?</head>'))) {
      finalCode = htmlCode;
    } else {
      const String headerContent = '''
 <head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>Web page Title</title>
 </head>''';
      finalCode =
          htmlCode.replaceAll(RegExp(r'<head[\s\S]*?</head>'), headerContent);
    }
  }

  @override
  Widget build(BuildContext context) {
    addViewPort(htmlCode);
    loadLocalHtml(finalCode);
    return WebViewWidget(
      controller: _controller,
    );
  }
}
