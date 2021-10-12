import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_news/models/news.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class NewsScreen extends StatefulWidget {
  const NewsScreen({ Key? key }) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  final url = "https://newsapi.org/v2/everything?q=tesla&from=2021-09-12&sortBy=publishedAt&apiKey=cbd6da9e64e946cbb843715308b3de0b";

  // late News n;

  @override
  void initState() {
    loaddata();
    super.initState();
  }



  loaddata() async{
    var response = await http.get(Uri.parse(url));
    var body = response.body;
    var b_json = jsonDecode(body);
    var r_data = b_json["articles"];

    News.news = List.from(r_data).map((e) => News.fromjson(e)).toList();
    print(News.news);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Center(child: "News App".text.make()),
          ),
          body: ListView.builder(
            itemCount: News.news.length,
            itemBuilder: (context,index){
            return Container(
              child: News.news[index].title.text.make(),
            );
          }),
        ),
    );
  }
}