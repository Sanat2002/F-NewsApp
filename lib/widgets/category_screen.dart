import 'package:flutter/material.dart';
import 'package:flutter_news/models/articles.dart';
import 'package:flutter_news/widgets/news_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class Category extends StatefulWidget {
  final String cat;
  const Category({ Key? key ,required this.cat}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}


class _CategoryState extends State<Category> {
  List<Articles> cnews = [];
  var _loading = true;

  @override
  void initState() {
    super.initState();
    loadnews();
  }

  loadnews() async{
    cnews = await getcategorynews(widget.cat);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body:_loading?SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const Center(child: CircularProgressIndicator()),
      ): ListView.builder(
        itemCount: cnews.length,
        itemBuilder: (context,index){
          return BlogTile(imgurl: cnews[index].urlimg, title: cnews[index].title, desc: cnews[index].desc, url: cnews[index].url);
      }).p(10),
    );
  }
}