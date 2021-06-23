import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_aplikasi/helper/SQLITE/BookmarkService.dart';
import 'package:news_aplikasi/helper/model/SQLITE/bookmark.dart';

import 'package:webview_flutter/webview_flutter.dart';

class TampilanBerita extends StatefulWidget {
  final String blogUrl;
  TampilanBerita({this.blogUrl});
  @override
  _TampilanBeritaState createState() => _TampilanBeritaState();
}

class _TampilanBeritaState extends State<TampilanBerita> {
  final Completer<WebViewController> completer = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ken',
              style: TextStyle(color: Colors.orange),
            ),
            Text(
              'News',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ],
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context); //navigator buat balik ke screen sebelumnya
            }),
        elevation: 0,
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: ((WebViewController webViewController) {
            completer.complete(webViewController);
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          formdialog(context);
        },
        child: Icon(Icons.bookmark_border),
      ),
    );
  }
}

formdialog(BuildContext context) {
  var bookmarkNameController = TextEditingController();
  var bookmarkDescriptionController = TextEditingController();
  var _bookmark = Bookmark();
  var _bookmarkservice = BookmarkService();
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          actions: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                  color: Colors.red,
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ))),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                  color: Colors.blue,
                  child: TextButton(
                      onPressed: () async {
                        _bookmark.nama = bookmarkNameController.text;
                        _bookmark.description = bookmarkDescriptionController.text;
                        _bookmarkservice.Savebookmark(_bookmark);

                        Navigator.pop(context);
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ))),
            ),
          ],
          title: Text('Bookmark'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: bookmarkNameController,
                  decoration: InputDecoration(hintText: "Name of Bookmark", labelText: "Name"),
                ),
                TextField(
                  controller: bookmarkDescriptionController,
                  decoration: InputDecoration(hintText: 'Anything', labelText: 'Description'),
                )
              ],
            ),
          ),
        );
      });
}
