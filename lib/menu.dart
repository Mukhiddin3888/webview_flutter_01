import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key, required this.webViewController}) : super(key: key);

  final WebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value){
        switch (value){
          case _MenuOptions.navigationDelegate :
            webViewController.loadRequest(Uri.parse('https://youtube.com'));

            break;
        }
      },
      itemBuilder: (context) {
     return  [
       const PopupMenuItem(
           value: _MenuOptions.navigationDelegate,
           child: Text("Navigate to YouTube"))];
    },);
  }
}

enum _MenuOptions {
  navigationDelegate
}