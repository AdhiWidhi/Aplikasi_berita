import 'package:flutter/material.dart';
import 'package:news_aplikasi/helper/NewsAPI.org_Helper/news.dart';
import 'package:news_aplikasi/helper/model/NewsAPI.ORG_Model/news_model.dart';

import 'detail_berita.dart';

class KategoriNews extends StatefulWidget {
  final String category;
  KategoriNews({this.category});
  @override
  _KategoriNewsState createState() => _KategoriNewsState();
}

class _KategoriNewsState extends State<KategoriNews> {
  // ignore: deprecated_member_use
  List<ModelNews> article = new List<ModelNews>();
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getKategoriNews();
  }

  //method untuk ngambil berita
  getKategoriNews() async {
    KategoriBerita news = KategoriBerita();
    await news.getNews(widget.category);
    article = news.news;
    if (mounted)
      // tugas setState() untuk memberitahu widget bahwa ada object yang berubah pada State, sehingga akan melakukan build ulang pada Widget tersebut.
      setState(() {
        _loading = false;
      });
  }

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
        body: _loading //kondisi saaat data masih diakses melalui internet
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(), //widget nampilin loading
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 13),
                  child: ListView.builder(
                      itemCount: article.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return BlogList(
                            //yang ditampilkan sesuai dengan kebutuhan kayak di API Service
                            imageUrl: article[index].urlToImage,
                            title: article[index].title,
                            desc: article[index].description,
                            url: article[index].url);
                      }),
                ),
              ));
  }
}

class BlogList extends StatelessWidget {
  final String imageUrl, title, desc, url; //variable sesuaikan sama API service di newsapi.org

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
                    blogUrl:
                        url, //manggil variable blogUrl dari kelas tampil berita di (detail_berita.dart) dan ngisi dengan url dari kategori berita yang diakses
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
