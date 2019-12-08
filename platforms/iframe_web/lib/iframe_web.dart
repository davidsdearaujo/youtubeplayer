library iframe_web;

import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class IframeWidget extends StatefulWidget {
  final String url;

  const IframeWidget(
    this.url, {
    Key key,
  }) : super(key: key);

  @override
  _IframeWidgetState createState() => _IframeWidgetState();
}

class _IframeWidgetState extends State<IframeWidget> {
  String get key => 'iframe-web-${widget.url}';

  @override
  void initState() {
    super.initState();
    registerElement();
  }

  @override
  Widget build(BuildContext context) => HtmlElementView(viewType: key);

  void registerElement() {
    // ignore:undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      key,
      (int viewId) {
        final element = html.IFrameElement()..src = widget.url;
        return element;
      },
    );
  }
}
