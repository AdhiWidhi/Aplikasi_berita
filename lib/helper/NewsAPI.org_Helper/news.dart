import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_aplikasi/helper/model/NewsAPI.ORG_Model/news_model.dart';

class Berita {
  List<ModelNews> news = [];

  Future<void> getNews() async {
    String url = //top headline = berita utama
        "https://newsapi.org/v2/top-headlines?country=id&apiKey=3c9961a571974c538811f7b478bd1f16";
    var response = await http.get(Uri.parse(url)); //http request ke link diatas

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      //kondisi yang erplu dibuatuh untuk dapet request dari newsapi.org jadi disana harus ada status dengan kondisi ok
      jsonData["articles"].forEach((element) {
        //for each dipakek untuk setiap data yang ada di dalam articles.
        if (element["urlToImage"] != null && element['description'] != null) {
          //kondisi ketika element dalem article isi link gambar/gambar dan isi description baru dimasukin ke modelnews
          ModelNews modelNews = ModelNews(
            title: element[//isi elementnya sesuai sama di newsapi.org
                'title'],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
          );

          //nambahin modelNews ke list news, jadi list news isi datanya modelNews
          news.add(modelNews);
        }
      });
    }
  }
}

class KategoriBerita {
  List<ModelNews> news = [];

  Future<void> getNews(String category) async {
    String
        url = //category ini nanti disesuaiin pemakaiannya klok di newsapi.org categori yang dikasih huruf kecil semua nanti klok di pakek huruf kecil juga semua
        "https://newsapi.org/v2/top-headlines?category=$category&country=id&apiKey=3c9961a571974c538811f7b478bd1f16"; //$category di pakek manggil parameter yang dipasang di future jadi nanti bisa nampilin sesuai inputan parameternya
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ModelNews modelNews = ModelNews(
            title: element['title'],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["context"],
          );

          //nambahin model ke news
          news.add(modelNews);
        }
      });
    }
  }
}
