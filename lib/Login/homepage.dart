import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_aplikasi/View/home/detail_berita.dart';
import 'package:news_aplikasi/View/home/kategori_berita.dart';

import 'package:news_aplikasi/controller/authentication.dart';
import 'package:news_aplikasi/helper/NewsAPI.org_Helper/data.dart';
import 'package:news_aplikasi/helper/NewsAPI.org_Helper/news.dart';
import 'package:news_aplikasi/helper/model/NewsAPI.ORG_Model/category_model.dart';
import 'package:news_aplikasi/helper/model/NewsAPI.ORG_Model/news_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> signOut() async {
    await Authentification().signOut();
  }

  // ignore: deprecated_member_use
  List<CategoryModel> categories = new List<CategoryModel>();
  // ignore: deprecated_member_use
  List<ModelNews> article = new List<ModelNews>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    Berita news = Berita(); //variable news dinyatakan berisi kelas berita
    await news.getNews();
    article = news.news;
    if (mounted)
      setState(() {
        _loading = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
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
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
          elevation: 0,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(icon: Icon(Icons.notifications_none_outlined), onPressed: () {})
              ],
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                //bagian header pada drawer
                accountName: Text(
                  "Adhi Widhi",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                ),
                accountEmail: Text(
                  "adhiwidhi201@gmail.com",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                ),
                currentAccountPicture: GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1560261172-625fb59399fc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80"),
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1567473031096-c4961b38be9b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80  "))),
              ),
              ListTile(
                //widget untuk drawer di bagian list tilenya
                title: Text("Profile"),
                trailing: Icon(Icons.account_circle),
              ),
              ListTile(
                title: Text("Settings"),
                trailing: Icon(Icons.settings),
              ),
              ListTile(
                title: Text("Log Out"),
                trailing: Icon(Icons.logout),
                onTap: signOut,
              )
            ],
          ),
        ),
        body: _loading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Material(
                          elevation: 2,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 15),
                              hintText: "Search News",
                              suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: () {}),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //menu kategori
                      Container(
                        child: Text(
                          "Categories",
                          style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 60,
                        child: ListView.builder(
                            itemCount: categories.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Categorylist(
                                imageUrl: categories[index].imageUrl,
                                namaCategory: categories[index].namaCategory,
                              );
                            }),
                      ),

                      //beritanya
                      Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.only(top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Trending Topics",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w800),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              child: ListView.builder(
                                  itemCount: article.length,
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return BlogList(
                                        imageUrl: article[index]
                                            .urlToImage, //masukin sesuai parameter kelas bloglist
                                        title: article[index].title,
                                        desc: article[index].description,
                                        url: article[index].url); //
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

//kelas buat nampung gambar sama nama gambar dari data.dart
class Categorylist extends StatelessWidget {
  final String imageUrl, namaCategory;
  Categorylist({this.imageUrl, this.namaCategory});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.indigo,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KategoriNews(
              category: namaCategory
                  .toLowerCase(), //parameternya categorynya diisi sama variable namaCategory terus ini lowercase karena di newsapi.org categori nya semua huruf kecil
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                imageUrl, //imageUrl ni diambil dari kelas data.dart juga
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
              ),
              width: 120,
              height: 60,
              child: Text(
                namaCategory,
                style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogList extends StatelessWidget {
  final String imageUrl, title, desc, url;

  BlogList(
      {@required this.imageUrl, @required this.title, @required this.desc, @required this.url});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              // ignore: non_constant_identifier_names
              builder: (BuildContext) => TampilanBerita(
                    blogUrl: url, //blogurl sesuai sama parameter yang dipakek di detail_berita
                  )));
        },
        splashColor: Colors.indigo,
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Column(
            children: <Widget>[
              ClipRRect(borderRadius: BorderRadius.circular(6), child: Image.network(imageUrl)),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                desc,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
