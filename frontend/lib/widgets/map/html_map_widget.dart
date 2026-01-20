import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'dart:ui_web' as ui_web;
import 'dart:html' as html;

class HtmlMapWidget extends StatefulWidget {
  const HtmlMapWidget({super.key});

  @override
  State<HtmlMapWidget> createState() => _HtmlMapWidgetState();
}

class _HtmlMapWidgetState extends State<HtmlMapWidget> {
  final String viewId = 'google-maps-iframe';

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _registerViewFactory();
    }
  }

  void _registerViewFactory() {
    ui_web.platformViewRegistry.registerViewFactory(viewId, (int viewId) {
      final iframe = html.IFrameElement()
        ..src = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d8945.603120364223!2d126.96602433757288!3d37.560993157024484!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca28affe23f73%3A0x5bdcc37ce1fbfd4f!2z7Jik7Y6g66as7IqkIOybqOuUqey7qOuypOyFmA!5e0!3m2!1sko!2skr!4v1768448286827!5m2!1sko!2skr'
        ..style.border = "none"
        ..style.width = '100%'
        ..style.height = '100%'
        ..allowFullscreen = true
        ..setAttribute('loading', 'lazy')
        ..setAttribute('referrerpolicy', 'no-referrer-when-downgrade');
      return iframe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey[300]!))),
        child: kIsWeb
            ? HtmlElementView(viewType: viewId)
            : const Center(
          child: Text(
            "웹 브라우저에서만 지도를 볼 수 있다.",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ));
  }
}
