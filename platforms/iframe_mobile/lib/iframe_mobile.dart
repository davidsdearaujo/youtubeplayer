library iframe_mobile;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IframeWidget extends StatelessWidget {
  final String url;
  IframeWidget(this.url, {Key key}) : super(key: key);

  final _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
    );

    // return InAppWebView(
    //   initialUrl: _embedUrl,
    //   onWebViewCreated: (InAppWebViewController controller) {
    //     _controller = controller;
    //   },
    // ),
  }
}
