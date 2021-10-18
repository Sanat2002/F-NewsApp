import 'dart:convert';

import 'package:http/http.dart' as http;

class Articles {
  String author;
  String title;
  String desc;
  String url;
  String urlimg;
  String publish;
  String content;

  Articles({
    required this.author,
    required this.title,
    required this.desc,
    required this.url,
    required this.urlimg,
    required this.publish,
    required this.content,
  });
}

Future<List <Articles>> getnews() async {
  List<Articles> news = [];
  const url =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=cbd6da9e64e946cbb843715308b3de0b";

  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body);

  if (json["status"] == "ok") {
    json["articles"].forEach((element) {
      if (element["urlToImage"] != null && element["description"] != null && element["url"]!=null) {
        var obj = Articles(
          author: element["author"] ?? " ", // null check operator must be used
          title: element["title"] ?? " ",
          desc: element["description"] ?? " ",
          url: element["url"] ?? " ",
          urlimg: element["urlToImage"] ?? " ",
          publish: element["publishedAt"] ?? " ",
          content: element["content"] ?? " ",
        );
        news.add(obj);
      }
    });
  }
  return news;
}

Future<List <Articles>> getcategorynews(String category) async {
  List<Articles> news = [];
  var url =
      "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=cbd6da9e64e946cbb843715308b3de0b";

  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body);

  if (json["status"] == "ok") {
    json["articles"].forEach((element) {
      if (element["urlToImage"] != null && element["description"] != null) {
        var obj = Articles(
          author: element["author"] ?? " ",
          title: element["title"] ?? " ",
          desc: element["description"] ?? " ",
          url: element["url"] ?? " ",
          urlimg: element["urlToImage"] ?? " ",
          publish: element["publishedAt"] ?? " ",
          content: element["content"] ?? " ",
        );
        news.add(obj);
      }
    });
  }
  return news;
}
