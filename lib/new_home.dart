import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import 'main.dart';

class NewHome extends StatefulWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  late WebViewPlusController _controller;
  double _height = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('test'),
      ),
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              width: 500,
              height: 400,
              child: IgnorePointer(
                child: WebViewPlus(
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (controller) {
                    _controller = controller;
                    controller.loadUrl(htmlUri.toString());
                  },
                  onPageFinished: (controller) {
                    _controller.getHeight().then((height) {
                      setState(() {
                        _height = height;
                      });
                    });
                  },
                  zoomEnabled: false,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
