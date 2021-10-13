// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_news/models/articles.dart';
import 'package:flutter_news/models/category.dart';
import 'package:flutter_news/widgets/category_screen.dart';
import 'package:flutter_news/widgets/newsdetail_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({ Key? key }) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  List<Articles> news = [];
  var _loading = true;

  @override
  void initState() {
    load();
    super.initState();
  }

  load() async{
    news = await getnews();
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
          body: SingleChildScrollView( // it is similar to scrollview
            child: Column(
              children: [ 
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      shrinkWrap: true, // it must be true always
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
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Category(cat: categoryname)));
      },
      child: Container(
        margin: EdgeInsets.only(right:8),
        child: Stack( // Stack is to be used -> it is used when we want to place widgets one on the top of the other
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