import 'package:flutter/material.dart';
import 'package:flutter_news/models/articles.dart';
import 'package:velocity_x/velocity_x.dart';

class Category extends StatefulWidget {
  final String cat;
  const Category({ Key? key ,required this.cat}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}


class _CategoryState extends State<Category> {
  List<Articles> cnews = [];
  @override
  void initState() {
    super.initState();
    loadnews();
  }

  loadnews() async{
    cnews = await getcategorynews(widget.cat);
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}