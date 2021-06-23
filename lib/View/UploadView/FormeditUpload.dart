import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:news_aplikasi/View/home/dashboard.dart';

// ignore: must_be_immutable
class FormEdit extends StatelessWidget {
  final Map upload;
  FormEdit({@required this.upload});
  final _formkey = GlobalKey<FormState>();
  TextEditingController _judulController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _deskripsiController = TextEditingController();
  TextEditingController _kontenController = TextEditingController();
  TextEditingController _gambarController = TextEditingController();

  //membuat method POST untuk Upload data ke API
  Future updateKonten() async {
    // karena ingin mengedit data maka menggunakan method PUT maka perlu tambahan body karena di body API kita akan menambahkan data object yang sudah ditulis harus sama dengan yang ada di API
    // dan tambahan pada url yaitu upload ["id"] fungsinya untuk mengetahui id data ke berapa yang diedit pada API
    final response = await http
        .put(Uri.parse("http://192.168.1.3:80/api/uploads/" + upload['id'].toString()), body: {
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
                      // controller ini diiskan spread .. text yang fungsinya untuk default memberikan nilai, dan nilai yang diambil adalah dari upload/database kita
                      // untuk isinya sesuaikan dengan kolom yang ada didatabase
                      controller: _judulController..text = upload['judul'],
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
                      controller: _namaController..text = upload['nama'],
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
                      controller: _deskripsiController..text = upload['deskripsi'],
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
                      controller: _kontenController..text = upload['konten'],
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
                      controller: _gambarController..text = upload['gambar'],
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
                                  updateKonten().then((value) {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => Dashboard()));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("Data sudah berhasil di ubah")));
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
                    )
                  ],
                ),
              )),
        ),
      ]),
    );
  }
}
