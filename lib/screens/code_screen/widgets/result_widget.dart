import 'package:webview_flutter/webview_flutter.dart';

import '../../../constants/consts.dart';

class ResultWidget extends StatelessWidget {
  ResultWidget(this._controller, this.loadLocalHtml, this.htmlCode,
      {super.key});

  final WebViewController _controller;
  final Function loadLocalHtml;

  final String htmlCode;
  late String finalCode;

  //This method will add the view port so that the content get zoomed
  void addViewPort(String htmlCode) {
    if (!htmlCode.contains("<!DOCTYPE html>") &&
        !htmlCode.contains("<!doctype html>")) {
      finalCode = htmlCode;
    } else {
      if (htmlCode.contains('<meta name="viewport" content="width=device-width, initial-scale=1.0">')) {
        finalCode = htmlCode;
      } else {
        const String headerContent = '''<!DOCTYPE html>
 <html>
 <head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>Web page Title</title>
 </head>''';
        finalCode = htmlCode.replaceRange(0, 75, headerContent);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    addViewPort(htmlCode);
    // loadLocalHtml(htmlCode);
    loadLocalHtml(finalCode);
    return WebViewWidget(
      controller: _controller,
    );
  }
}
