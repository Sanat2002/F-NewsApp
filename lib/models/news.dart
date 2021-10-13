class News {

  static List<News> news=[];

  final String author;
  final String title;
  final String desc;
  final String url;
  final String urlimg;
  final String publish;
  final String content;

  News({
    required this.author,
    required this.title,
    required this.desc,
    required this.url,
    required this.urlimg,
    required this.publish,
    required this.content,
  });

  factory News.fromjson(Map<String,dynamic> json){
    return News(
      author: json["author"] ?? " ", // null operator must be used
      title: json["title"] ?? " ",
      desc: json["desc"] ?? " ",
      url: json["url"] ?? " ",
      urlimg: json["urlimg"] ?? " ",
      publish: json["publish"] ?? " ",
      content: json["content"] ?? " ",
    );
  }

}
