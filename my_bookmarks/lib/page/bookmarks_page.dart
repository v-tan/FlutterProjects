import 'package:flutter/material.dart';
import 'package:my_bookmarks/page/add_bookmark._page.dart';
import 'package:my_bookmarks/util/navigation_util.dart';
import 'package:my_bookmarks/widget/bookmark_list_widget.dart';

import '../model/bookmark.dart';
import '../widget/bookmark_grid_widget.dart';

class BookmarksPage extends StatefulWidget {
  @override
  _BookmarksPageState createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  bool _isGridMode = false;
  final List<Bookmark> bookmarksList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Bookmarks"),
        actions: [
          IconButton(
            icon: _isGridMode ? Icon(Icons.list) : Icon(Icons.grid_view),
            onPressed: () {
              setState(() {
                _isGridMode = !_isGridMode;
              });
            },
          )
        ],
      ),
      body: _isGridMode
          ? BookmarksGridWidget(bookmarksList)
          : BookmarksListWidget(bookmarksList),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Add'),
        icon: Icon(Icons.add),
        onPressed: () => _onAddButtonPressed(context),
      ),
    );
  }

  void _onAddButtonPressed(BuildContext context) async {
    var result = await navigateToAddBookmarkPage(context);

    if (result != null && result is Bookmark) {
      setState(() {
        bookmarksList.add(result);
      });
    }
  }
}
