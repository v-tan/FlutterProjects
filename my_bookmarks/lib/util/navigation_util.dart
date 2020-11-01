import 'package:flutter/material.dart';
import 'package:my_bookmarks/model/bookmark.dart';
import 'package:my_bookmarks/page/add_bookmark._page.dart';
import 'package:my_bookmarks/page/view_bookmark_page.dart';

void navigateToViewBookmarkPage(Bookmark bookmark, context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => ViewBookmarkPage(bookmark)),
  );
}

Future navigateToAddBookmarkPage(context) {
  return Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => AddBookmarkPage()),
  );
}
