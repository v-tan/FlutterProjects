import 'package:flutter/material.dart';

import '../model/bookmark.dart';
import 'bookmark_grid_item_widget.dart';

class BookmarksGridWidget extends StatelessWidget {
  final List<Bookmark> bookmarksList;

  const BookmarksGridWidget(this.bookmarksList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: GridView.builder(
        itemCount: bookmarksList.length,
        itemBuilder: (BuildContext context, int index) {
          return BookmarkGridItemWidget(bookmarksList[index]);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.8,
          crossAxisCount: 2,
          crossAxisSpacing: 6,
        ),
      ),
    );
  }
}
