import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
import 'package:webview_flutter/webview_flutter.dart';

class YoutubeLivePlayerWidget extends StatefulWidget {
  @override
  _YoutubeLivePlayerWidgetState createState() => _YoutubeLivePlayerWidgetState();

  final String channelId;
  final bool autoPlay;
  final double aspectRatio;
  YoutubeLivePlayerWidget({
    @required this.channelId,
    this.autoPlay = false,
    this.aspectRatio = 16 / 9,
  });
}

class _YoutubeLivePlayerWidgetState extends State<YoutubeLivePlayerWidget> {
  // InAppWebViewController _controller;
  var _controller = Completer<WebViewController>();

  String get _embedUrl =>
      "https://www.youtube.com/embed/live_stream?channel=${widget.channelId}" +
      (widget.autoPlay ? "?autoplay=1" : "");

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.aspectRatio,
      child: WebView(
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          initialUrl: _embedUrl,
          javascriptMode: JavascriptMode.unrestricted,
      ),
      // child: InAppWebView(
      //   initialUrl: _embedUrl,
      //   onWebViewCreated: (InAppWebViewController controller) {
      //     _controller = controller;
      //   },
      // ),
    );
  }
}
