import 'package:flutter/material.dart';

import 'package:iframe_mobile/iframe_mobile.dart'
    if (dart.library.html) 'package:iframe_web/iframe_web.dart';

class PlatformWidget extends StatelessWidget {
  final String url;

  const PlatformWidget(this.url, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IframeWidget(url);
  }
}
