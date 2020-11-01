import 'package:flutter/material.dart';
import 'package:my_bookmarks/model/bookmark.dart';

import 'package:my_bookmarks/widget/view_web_page_widget.dart';

class ViewBookmarkPage extends StatelessWidget {
  final Bookmark bookmark;

  ViewBookmarkPage(this.bookmark);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View bookmark'),
      ),
      body: ViewWebPageWidget(bookmark.link),
    );
  }
}
