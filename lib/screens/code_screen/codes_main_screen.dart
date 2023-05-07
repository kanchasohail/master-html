import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_html/cubits/theme_cubit/theme_cubit.dart';
import 'package:master_html/screens/code_screen/widgets/code_theme_changing_card.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '../../constants/consts.dart';

import 'package:code_text_field/code_text_field.dart';
import 'package:master_html/cubits/codes_cubit/code_cubit.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:master_html/screens/code_screen/widgets/edit_code_widget.dart';

import 'package:master_html/screens/code_screen/widgets/result_widget.dart';

import 'package:highlight/languages/xml.dart';

class CodesMainScreen extends StatefulWidget {
  static const routeName = "/codes-main-screen";

  const CodesMainScreen({Key? key}) : super(key: key);

  @override
  State<CodesMainScreen> createState() => _CodesMainScreenState();
}

class _CodesMainScreenState extends State<CodesMainScreen> {
  bool isFirst = true;

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
    if (CodeCubit.codeCubitCodeString == null) {
      CodeCubit.saveMainEditorCode(codeText: codeController.text);
    }
    CodeCubit.codeCubitCodeString = null;
    super.dispose();
  }

  void loadLocalHtml(String? htmlCode) async {
    final url = Uri.dataFromString(
      htmlCode!,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString();
    webViewController.loadRequest(Uri.parse(url));
  }

  final codeController = CodeController(
    text: CodeCubit.codeCubitCodeString != null ?   CodeCubit.addBoilerPlateCode(CodeCubit.codeCubitCodeString!)  : CodeCubit.getMainEditorCode(),
    language: xml,
  );

  @override
  Widget build(BuildContext context) {
    final Color themeIconColor =
        Theme.of(context).iconTheme.color ?? orangeColor;
    final codeCubit = BlocProvider.of<CodeCubit>(context);
    return Scaffold(
      floatingActionButton: isFirst && CodeCubit.codeCubitCodeString == null
          ? FloatingActionButton(
              backgroundColor: Colors.orange.shade50,
              onPressed: () {
                CodeCubit.saveMainEditorCode(codeText: codeController.text);
              },
              child: const Icon(
                Icons.save,
                color: orangeColor,
              ),
            )
          : const SizedBox(),
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
                            height: 38,
                            width: 100,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: themeIconColor, width: 1),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
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
                            height: 38,
                            width: 100,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: themeIconColor, width: 1),
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(5),
                                    topRight: Radius.circular(5)),
                                color: isFirst
                                    ? Colors.transparent
                                    : themeIconColor),
                            child: const Center(child: Text("Output")),
                          ),
                        ),
                      ],
                    ),
                    isFirst
                        ? IconButton(
                            onPressed: () {
                              codeCubit.popUpCard();
                            },
                            icon: BlocBuilder<CodeCubit, CodeState>(
                                builder: (context, state) {
                              if (state is CodeThemeCardOpenState) {
                                return const Icon(CupertinoIcons.xmark,
                                    size: 25);
                              } else {
                                return const Icon(
                                  Icons.settings,
                                );
                              }
                            }),
                            splashRadius: 28)
                        : IconButton(
                            onPressed: () {
                              codeCubit.saveAndShareResultImage(
                                  context: context);
                            },
                            icon: const Icon(Icons.share_outlined)),
                    // : PopupMenuButton(
                    //   icon: const Icon(Icons.read_more),
                    //   elevation: 4,
                    //   shadowColor: orangeColor,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(4),
                    //     side: const BorderSide(color: orangeColor , width: 0.2)
                    //   ),
                    //   onSelected: (value) async {
                    //     final String currentUrl = await webViewController.currentUrl() ?? "" ;
                    //     switch (value){
                    //       case '/share':
                    //         print("Share Option selected");
                    //         break ;
                    //       case '/openInBrowser':
                    //         print("Open in browser option selected");
                    //         print(currentUrl);
                    //         launchUrl(Uri.parse(currentUrl));
                    //         break ;
                    //     }
                    //   },
                    //   itemBuilder: (BuildContext bc) {
                    //     return  [
                    //       const PopupMenuItem(
                    //         value: '/openInBrowser',
                    //         child: Text("Open In Browser"),
                    //       ),
                    //       const PopupMenuItem(
                    //         value: '/share',
                    //         child:  Text("Share"),
                    //       )
                    //     ];
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ),
          if (isFirst)
            BlocBuilder<CodeCubit, CodeState>(builder: (context, state) {
              if (state is CodeThemeCardOpenState) {
                return const CodeThemeChangingCard();
              } else {
                return const SizedBox();
              }
            }),
          isFirst
              ? BlocBuilder<CodeCubit, CodeState>(builder: (context, state) {
                final bool isDarkMode = BlocProvider.of<ThemeCubit>(this.context).themeMode == ThemeMode.dark ;
                  final codeTextTheme = codeCubit.getCurrentCodeTheme(isDarkMode: isDarkMode);
                  final bool isWrapOn = codeCubit.getWrapCodeCurrentSetting();
                  return EditCodeWidget(
                    controller: codeController,
                    textTheme: codeTextTheme,
                    isWrapOn: isWrapOn,
                  );
                })
              : Expanded(
                  child: WidgetsToImage(
                    controller: codeCubit.widgetsToImageController,
                    child: ResultWidget(
                        webViewController, loadLocalHtml, codeController.text),
                  ),
                )
        ],
      ),
    );
  }
}
