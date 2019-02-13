import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
import 'package:webview_flutter/webview_flutter.dart';

class YoutubePlayerWidget extends StatefulWidget {
  @override
  _YoutubePlayerWidgetState createState() => _YoutubePlayerWidgetState();

  final String link;
  final bool autoPlay;
  final double aspectRatio;
  YoutubePlayerWidget({
    @required this.link,
    this.autoPlay = false,
    this.aspectRatio = 16 / 9,
  });
}

class _YoutubePlayerWidgetState extends State<YoutubePlayerWidget> {
  // InAppWebViewController _controller;
  var _controller = Completer<WebViewController>();

  String get _videoId {
    RegExp rgx = RegExp(
      r".*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=|\?v=)([^#\&\?]*).*",
    );
    print(rgx.hasMatch(widget.link));
    var t = rgx.allMatches(widget.link);

    if (t.length > 0 && t.last?.groupCount != null && t.last.groupCount >= 2)
      return t.last.group(2);
    else
      return widget.link;
  }

  String get _embedUrl =>
      "https://www.youtube.com/embed/${_videoId}" +
      (widget.autoPlay ? "?autoplay=1" : "");

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.aspectRatio,
      child:WebView(
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
