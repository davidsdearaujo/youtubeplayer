import 'package:flutter/material.dart';

import 'platform_widget.dart';

class YoutubeLivePlayerWidget extends StatefulWidget {
  @override
  _YoutubeLivePlayerWidgetState createState() =>
      _YoutubeLivePlayerWidgetState();

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
  String get _embedUrl =>
      "https://www.youtube.com/embed/live_stream?channel=${widget.channelId}" +
      (widget.autoPlay ? "?autoplay=1" : "");

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.aspectRatio,
      child: PlatformWidget(_embedUrl),
    );
  }
}
