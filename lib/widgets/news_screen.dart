// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_news/models/articles.dart';
import 'package:flutter_news/models/category.dart';
import 'package:flutter_news/models/news.dart';
import 'package:flutter_news/widgets/newsdetail_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class NewsScreen extends StatefulWidget {
  const NewsScreen({ Key? key }) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  // final url = "https://newsapi.org/v2/everything?q=tesla&from=2021-09-12&sortBy=publishedAt&apiKey=cbd6da9e64e946cbb843715308b3de0b";

  // // late News n;

  // @override
  // void initState() {
  //   loaddata();
  //   super.initState();
  // }



  // loaddata() async{
  //   var response = await http.get(Uri.parse(url));
  //   var body = response.body;
  //   var b_json = jsonDecode(body);
  //   var r_data = b_json["articles"];

  //   News.news = List.from(r_data).map((e) => News.fromjson(e)).toList();
  //   print(News.news);
  //   setState(() {
      
  //   });
  // }

  List<Articles> news = [];
  var _loading = true;

  @override
  void initState() {
    // news = getnews();
    load();
    super.initState();
  }

  load() async{
    news = await getnews();
    print(news.length);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                "News".text.black.make(),
                "App".text.color(Colors.lightBlue).make()
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [ 
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: getCategories().length,
                      itemBuilder: (context,index){
                        return CategoryTile(imageurl : getCategories()[index].imageurl,categoryname:getCategories()[index].categoryname);
                      }),
                  ),
                  10.heightBox,
                    _loading?SizedBox(
                      height: MediaQuery.of(context).size.height*.7, // it gives the height of the screen multiply by .7 -> 70% of height of screen
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ) : SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          "Today's Top".text.xl4.color(Colors.lightBlue).make(),
                          " News".text.xl4.extraBlack.make()
                        ],
                      )
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: news.length,                  
                      itemBuilder: (context,index){
                        return BlogTile(imgurl: news[index].urlimg, title: news[index].title, desc: news[index].desc,url: news[index].url,);
                    }).px12(),
                ],
              ),
          ),
          // )
          // body: SingleChildScrollView(
          //   // p
          //   scrollDirection: Axis.vertical,
          //   child: ListView.builder(
          //     physics: const NeverScrollableScrollPhysics(),
          //             shrinkWrap: true,
          //             scrollDirection: Axis.vertical,
          //             itemCount: news.length,                  
          //             itemBuilder: (context,index){
          //               return BlogTile(imgurl: news[index].urlimg, title: news[index].title, desc: news[index].desc);
          //           }),
          // ),
        ),
    );
  }
}

class CategoryTile extends StatelessWidget {

  final String imageurl;
  final String categoryname;

  const CategoryTile({ Key? key , required this.imageurl,required this.categoryname}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        
      },
      child: Container(
        margin: EdgeInsets.only(right:8),
        child: Stack( // Stack is to be used
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(imageurl,width: 120,height: 80,fit:BoxFit.cover,)),
              Container(
                width: 120,
                height:80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color:Colors.black26,
                ),
                child: Center(child: categoryname.text.xl.white.make()))
            ],
          ),
      ).px(8),
    );
  }
}


class BlogTile extends StatelessWidget {

  final String imgurl,title,desc,url;

  const BlogTile({ Key? key,required this.imgurl,required this.title,required this.desc,required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetail(blogurl: url)));
      },
      child: Column(
        children:[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 210,
              width: 400,
              child: Image.network(imgurl))),
          title.text.extraBlack.xl.make(),
          desc.text.color(Vx.gray700).make().py8()
        ]
      ).py8(),
    );
  }
}