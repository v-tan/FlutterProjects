import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:my_bookmarks/widget/common/loading_indicator_widget.dart';

class ViewWebPageWidget extends StatefulWidget {
  final String url;

  ViewWebPageWidget(this.url);

  @override
  _ViewWebPageWidgetState createState() => _ViewWebPageWidgetState();
}

class _ViewWebPageWidgetState extends State<ViewWebPageWidget> {
  var _isLoadingWebPage = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (url) {
            setState(() {
              _isLoadingWebPage = false;
            });
          },
        ),
        _isLoadingWebPage ? LoadingIndicator() : Container(),
      ],
    );
  }
}
