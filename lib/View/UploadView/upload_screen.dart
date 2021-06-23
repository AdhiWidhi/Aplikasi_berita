import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_aplikasi/View/UploadView/FormeditUpload.dart';
import 'package:news_aplikasi/View/UploadView/detail_upload.dart';

import 'formUpload.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({
    Key key,
  }) : super(key: key);

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final String url = "http://192.168.1.3/api/uploads";

  Future getUploads() async {
    var response = await http.get(Uri.parse(url));
    print(jsonDecode(response.body));
    return jsonDecode(response.body);
  }

  @override
  void initState() {
    super.initState();
    getUploads();
  }

  Future deleteData(String dataId) async {
    final String url = "http://192.168.1.3/api/uploads/" + dataId;
    var response = await http.delete(Uri.parse(url));
    setState(() {
      jsonDecode(response.body);
    });
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.ac_unit,
          color: Colors.white,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Up',
              style: TextStyle(color: Colors.orange),
            ),
            Text(
              'load',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        elevation: 2,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => FormUpload()));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Your Article",
                      style: TextStyle(
                          fontSize: 18, fontStyle: FontStyle.italic, fontWeight: FontWeight.w800),
                    )),
              ),
              FutureBuilder(
                  future: getUploads(),
                  builder: (context, x) {
                    if (x.hasData) {
                      return ListView.builder(
                          itemCount: x.data['data'].length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                                height: 240,
                                padding: EdgeInsets.only(top: 5),
                                child: Card(
                                  elevation: 8,
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => DetailUpload(
                                                      upload: x.data['data'][index],
                                                    )));
                                      },
                                      splashColor: Colors.indigo,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            height: 220,
                                            width: 200,
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(6),
                                                child: Hero(
                                                  tag: x.data['data'][index]['gambar'],
                                                  child: Material(
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => DetailUpload(
                                                                    upload: x.data['data']
                                                                        [index])));
                                                      },
                                                      child: Image.network(
                                                        x.data['data'][index]['gambar'],
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.all(10),
                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                              child: Column(
                                                children: <Widget>[
                                                  Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Text(
                                                      x.data['data'][index]['judul'],
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      x.data['data'][index]['deskripsi'],
                                                      style: TextStyle(fontSize: 14),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      IconButton(
                                                          icon: Icon(
                                                            Icons.edit,
                                                            color: Colors.blue,
                                                          ),
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) => FormEdit(
                                                                        upload: x.data['data']
                                                                            [index])));
                                                          }),
                                                      IconButton(
                                                          icon:
                                                              Icon(Icons.delete, color: Colors.red),
                                                          onPressed: () {
                                                            deleteData(x.data['data'][index]['id']
                                                                    .toString())
                                                                .then((value) {
                                                              setState(() {});
                                                              ScaffoldMessenger.of(context)
                                                                  .showSnackBar(SnackBar(
                                                                      content: Text(
                                                                          "Data sudah berhasil di hapus")));
                                                            });
                                                          })
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                ));
                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
