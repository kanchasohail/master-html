import 'package:flutter/material.dart';
void showSnackBar(
    {required BuildContext ctx,
    required String messageText,
    required Color bgColor}) {
  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
    content: Text(messageText , style:  const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
    backgroundColor: bgColor,
  ));
}
