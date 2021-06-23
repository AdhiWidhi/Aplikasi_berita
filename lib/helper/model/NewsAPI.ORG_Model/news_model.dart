class ModelNews {
  //isi variable di kelas model ini sesuai sama newsapi.org nya yang isi title,url yang ke bold
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;

  //parameter buat di news
  ModelNews({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.content,
  });
}
