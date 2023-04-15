import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:code_text_field/code_text_field.dart';
import 'package:master_html/cubits/codes_cubit/code_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter_highlight/themes/atom-one-light.dart';
import 'package:flutter_highlight/themes/darcula.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_highlight/themes/vs.dart';

import 'package:highlight/languages/html.dart';

import 'package:master_html/screens/code_screen/widgets/edit_code_widget.dart';
import 'package:master_html/screens/code_screen/widgets/result_widget.dart';

import '../../constants/consts.dart';

class CodesMainScreen extends StatefulWidget {
  static const routeName = "/codes-main-screen";

  const CodesMainScreen({Key? key}) : super(key: key);


  @override
  State<CodesMainScreen> createState() => _CodesMainScreenState();
}

class _CodesMainScreenState extends State<CodesMainScreen> {
  bool isFirst = true;

  //These are relate to result screen ;
  late final WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    final WebViewController controller = WebViewController();

    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    webViewController = controller;
  }

  @override
  void dispose() {
    CodeCubit.codeCubitCodeString = "";
    super.dispose();
  }

//This method loads the html code for the webView
  void loadLocalHtml(String? htmlCode) async {
    final url = Uri.dataFromString(
      htmlCode!,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString();
    webViewController.loadRequest(Uri.parse(url));
  }

// These are relate to code editing screen

  final codeController = CodeController(
  text: CodeCubit.codeCubitCodeString != "" ? CodeCubit.codeCubitCodeString : CodeCubit.getMainEditorCode,
    language: html,
  );

  Map<String, TextStyle> _textTheme = monokaiSublimeTheme;

  @override
  Widget build(BuildContext context) {
    final Color themeIconColor =
        Theme.of(context).iconTheme.color ?? orangeColor;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          CupertinoIcons.xmark,
                        )),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isFirst = true;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: themeIconColor, width: 1),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8)),
                                color: isFirst
                                    ? themeIconColor
                                    : Colors.transparent),
                            child: const Center(child: Text("Code")),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isFirst = false;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: themeIconColor, width: 1),
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(8),
                                    topRight: Radius.circular(8)),
                                color: isFirst
                                    ? Colors.transparent
                                    : themeIconColor),
                            child: const Center(child: Text("Output")),
                          ),
                        ),
                      ],
                    ),
                    isFirst
                        ? PopupMenuButton(
                            icon: const Icon(Icons.color_lens_outlined),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: themeIconColor),
                                borderRadius: BorderRadius.circular(12)),
                            onSelected: (value) {
                              setState(() {
                                if (value == 'Atom') {
                                  _textTheme = atomOneLightTheme;
                                } else if (value == 'Monokai-subline') {
                                  _textTheme = monokaiSublimeTheme;
                                } else if (value == 'VS') {
                                  _textTheme = vsTheme;
                                } else if (value == 'Darcula') {
                                  _textTheme = darculaTheme;
                                }
                              });
                            },
                            itemBuilder: (context) => <String>[
                                  'Atom',
                                  'Monokai-subline',
                                  'VS',
                                  'Darcula'
                                ]
                                    .map((value) => PopupMenuItem(
                                            child: PopupMenuItem(
                                          value: value,
                                          child: Text(value),
                                        )))
                                    .toList())
                        : IconButton(
                            onPressed: () {}, icon: const Icon(Icons.share)),
                  ],
                ),
              ),
            ),
          ),
          isFirst
              ? EditCodeWidget(codeController, _textTheme)
              : ResultWidget(
                  webViewController, loadLocalHtml, codeController.text)
        ],
      ),
    );
  }
}
