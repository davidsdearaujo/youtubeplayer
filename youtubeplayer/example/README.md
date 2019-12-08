## pubspec.yaml
```yaml
version: 1.0.0+1

environment:
  sdk: ">=2.1.0 <3.0.0"

dependencies:
  youtubeplayer:
    path: ../
  flutter:
    sdk: flutter

  cupertino_icons: ^0.1.2

dev_dependencies:
  flutter_test:
    sdk: flutter

flutter:
  uses-material-design: true
```

## lib/main.dart
```dart
import 'package:flutter/material.dart';
import 'package:youtubeplayer/youtubeplayer.dart';

void main() => runApp(YoutubePlayerExample());

class YoutubePlayerExample extends StatelessWidget {
  static const String _title = 'Youtube Player Example';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: YoutubePlayerWidget(
            link: "https://www.youtube.com/watch?v=8XjYw_O__7w",
            aspectRatio: 16/9,
            autoPlay: false,
          ),
        ),
      ),
    );
  }
}
```