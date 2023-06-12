import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NavigationControls extends StatelessWidget {
  const NavigationControls({Key? key, required this.webViewController})
      : super(key: key);

  final WebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              if (await webViewController.canGoBack()) {
                await webViewController.goBack();
              } else {
                messenger.showSnackBar(
                    const SnackBar(content: Text("No Backward history item")));
                return;
              }
            },
            icon: const Icon(Icons.arrow_back_ios)),
        IconButton(
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              if (await webViewController.canGoForward()) {
                await webViewController.goForward();
              } else {
                messenger.showSnackBar(
                    const SnackBar(content: Text("No Forward history item")));
                return;
              }
            },
            icon: const Icon(Icons.arrow_forward_ios)),
        IconButton(
            onPressed: () {
              webViewController.reload();
            },
            icon: const Icon(Icons.replay)),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ],
    );
  }
}
