

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_in_flutter_1/menu.dart';
import 'package:webview_in_flutter_1/webview_controls.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key, required this.webViewController}) : super(key: key);

  final WebViewController webViewController;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    widget.webViewController
      ..loadRequest(Uri.parse('https://flutter.dev'))
    ..setNavigationDelegate(NavigationDelegate(
      onPageStarted: (url){
        setState(() {
          loadingPercentage = 0;

        });
      },
      onProgress: (progress){
        setState(() {
          loadingPercentage = progress;

        });
      },
      onPageFinished: (url){
        setState(() {
          loadingPercentage = 100;

        });
      },
      onNavigationRequest: (navigation){
        final host = Uri.parse(navigation.url).host;

        if(host.contains('youtube.com')){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Blocking navigation to $host')));
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      }
    ))
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mukhiddin"),actions: [NavigationControls(webViewController: widget.webViewController), Menu(webViewController: widget.webViewController)],),
      body: Stack(
          children:[
        WebViewWidget(controller: widget.webViewController),
         if  (loadingPercentage < 100)
              LinearProgressIndicator(
                value: loadingPercentage / 100

              )

          ]),
    );
  }
}
