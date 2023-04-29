import 'package:webview_flutter/webview_flutter.dart';

import '../../../constants/consts.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget(this._controller, this.loadLocalHtml, this.htmlCode , {super.key});

  final WebViewController _controller;
 final Function loadLocalHtml ;
 final String htmlCode ;


  @override
  Widget build(BuildContext context) {
    loadLocalHtml(htmlCode) ;
    return WebViewWidget(
      controller: _controller,
    );
  }
}
