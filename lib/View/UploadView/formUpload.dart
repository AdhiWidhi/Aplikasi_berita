import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:news_aplikasi/View/home/dashboard.dart';

class FormUpload extends StatefulWidget {
  @override
  _FormUploadState createState() => _FormUploadState();
}

class _FormUploadState extends State<FormUpload> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _judulController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _deskripsiController = TextEditingController();
  TextEditingController _kontenController = TextEditingController();
  TextEditingController _gambarController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  //membuat method POST untuk Upload data ke API
  Future saveUpload() async {
    // karena ingin menambahkan data/POST maka perlu tambahan body karena di body API kita akan menambahkan data object yang ditulis harus sama dengan yang ada di API
    final response = await http.post(Uri.parse("http://192.168.1.3:80/api/uploads"), body: {
      "judul": _judulController.text,
      "nama": _namaController.text,
      "deskripsi": _deskripsiController.text,
      "konten": _kontenController.text,
      "gambar": _gambarController.text,
    });
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
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
        actions: [
          Icon(
            Icons.ac_unit,
            color: Colors.white,
          ),
          Icon(
            Icons.ac_unit,
            color: Colors.white,
          )
        ],
      ),
      body: ListView(children: [
        Container(
          child: Form(
              key: _formkey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _judulController,
                      decoration: InputDecoration(
                        labelText: "Title",
                        hintText: "Berita Hot",
                        icon: Icon(
                          Icons.title_outlined,
                          color: Colors.blue,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                            borderRadius: BorderRadius.circular(30)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the title";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _namaController,
                      decoration: InputDecoration(
                        labelText: "Name",
                        icon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        hintText: "Pudidi",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                            borderRadius: BorderRadius.circular(30)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _deskripsiController,
                      decoration: InputDecoration(
                        labelText: "Desciption",
                        hintText: "Isi deskripsi tulisan anda",
                        icon: Icon(
                          Icons.description_outlined,
                          color: Colors.orange,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                            borderRadius: BorderRadius.circular(30)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please fill in the decription";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _kontenController,
                      decoration: InputDecoration(
                        labelText: "Content",
                        hintText: "isi dari tulisan anda",
                        icon: Icon(
                          Icons.edit,
                          color: Colors.indigo,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                            borderRadius: BorderRadius.circular(30)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      maxLines: 15,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please fill in the content";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _gambarController,
                      decoration: InputDecoration(
                        labelText: "Image",
                        icon: Icon(
                          Icons.photo,
                          color: Colors.green,
                        ),
                        hintText: "Url gambar",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                            borderRadius: BorderRadius.circular(30)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the ImageUrl";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                              color: Colors.blue,
                              shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                              onPressed: () {
                                if (_formkey.currentState.validate()) {
                                  saveUpload().then((value) {
                                    Navigator.pop(context);
                                  });
                                }
                              },
                              child: Text(
                                "Upload",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          width: double.infinity,
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                              color: Colors.red,
                              shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                              onPressed: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => Dashboard()));
                              },
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ]),
    );
  }
}

class Upload {}
