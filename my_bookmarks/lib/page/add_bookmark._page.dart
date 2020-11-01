import 'package:flutter/material.dart';

import 'package:my_bookmarks/model/bookmark.dart';

class AddBookmarkPage extends StatefulWidget {
  @override
  _AddBookmarkPageState createState() => _AddBookmarkPageState();
}

class _AddBookmarkPageState extends State<AddBookmarkPage> {
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _linkTextController = TextEditingController();
  final FocusNode _linkFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            onPressed: () {
              String title = _titleTextController.text;
              String link = _linkTextController.text;

              Scaffold.of(context).hideCurrentSnackBar();
              if (isInputValid(title, link)) {
                Navigator.pop(context, Bookmark(title, link));
              } else {
                showInputError(context, title, link);
              }
            },
            child: Icon(Icons.check),
            backgroundColor: Colors.green,
          );
        },
      ),
      appBar: AppBar(
        title: Text('Add a new bookmark'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              controller: _titleTextController,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (textInput) {
                FocusScope.of(context).requestFocus(_linkFocusNode);
              },
              decoration: InputDecoration(
                icon: Icon(Icons.title),
                labelText: "Title",
                hintText: 'Title of the bookmark',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _linkTextController,
              focusNode: _linkFocusNode,
              decoration: InputDecoration(
                icon: Icon(Icons.link),
                labelText: "URL",
                hintText: 'Webpage Link',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleTextController.dispose();
    _linkTextController.dispose();
    _linkFocusNode.dispose();
    super.dispose();
  }

  bool isInputValid(String title, String link) =>
      title.isNotEmpty && link.isNotEmpty;

  void showInputError(BuildContext context, String title, String link) {
    if (title.isEmpty) {
      showSnackbar(context, "Title is Empty");
    } else if (link.isEmpty) {
      showSnackbar(context, "Link is Empty");
    }
  }

  void showSnackbar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text("$message")));
  }
}
