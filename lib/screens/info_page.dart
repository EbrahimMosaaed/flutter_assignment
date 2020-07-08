import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'widgets/bottom_bar.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: 'https://www.pharous.com/'),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black87,
          tooltip: ' Home ',
          label: Text("Home"),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomBarWidget());
  }
}
