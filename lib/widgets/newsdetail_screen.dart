import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class NewsDetail extends StatefulWidget {
  final String blogurl;

  const NewsDetail({ Key? key,required this.blogurl}) : super(key: key);

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {

  final Completer<WebViewController> _hel = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                "News".text.black.make(),
                "App".text.color(Colors.lightBlue).make()
              ],
            ),
          ),
        body: WebView(
          initialUrl: widget.blogurl,
          onWebViewCreated: ((WebViewController webviewController){
            _hel.complete(webviewController);
          }),
        ),
      ),
    );
  }
}