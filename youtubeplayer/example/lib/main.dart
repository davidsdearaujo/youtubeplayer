import 'package:flutter/material.dart';
import 'package:youtubeplayer/youtubeplayer.dart';

void main() => runApp(YoutubePlayerExample());

class YoutubePlayerExample extends StatelessWidget {
  static const String _title = 'URL Launcher Example';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: LaunchButton(),
      ),
    );
  }
}

class LaunchButton extends StatelessWidget {
  LaunchButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: YoutubePlayerWidget(
        link: "https://www.youtube.com/watch?v=8XjYw_O__7w",
        aspectRatio: 16/9,
        autoPlay: false,
      ),
    );
  }
}
