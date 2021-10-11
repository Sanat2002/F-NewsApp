import 'package:flutter/material.dart';
import 'package:flutter_news/widgets/news_screen.dart';
import 'package:velocity_x/velocity_x.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context) => NewsScreen(),
      },

    );
  }
}


// import 'dart:convert';
// // import 'package:demo/news.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_news/models/news.dart';
// import 'package:http/http.dart' as http;

// void main(){
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({ Key? key }) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final url = "https://newsapi.org/v2/everything?q=tesla&from=2021-09-11&sortBy=publishedAt&apiKey=cbd6da9e64e946cbb843715308b3de0b";
//   List<News> news = [];
//   late bool display;

//   @override
//   void initState() {
//     loaddata();
//     setState(() {
//       display = false;
//     });
//     super.initState();
//   }

//   loaddata() async{
//     var response = await http.get(Uri.parse(url));
//     var re = response.body;
//     var dedata = jsonDecode(re);
//     var acdata = dedata["articles"];
//     print(dedata);
//     news = List.from(acdata).map((e) => News.fromjson(e)).toList();
//     /// setting display to true when the data from [acdata] is fetched into [news] list
//     setState(() {
//       display = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('News'),
//         ),
//         body: Container(
//           padding: EdgeInsets.all(20),
//           child: display ? ListView.builder(
//             itemBuilder: (BuildContext context, int index) {
//               return Container(
//                 padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                 margin: EdgeInsets.symmetric(vertical: 10),
//                 decoration: BoxDecoration(
//                     color: Colors.lightBlue.shade300,
//                     borderRadius: BorderRadius.circular(20)
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(5),
//                       child: Text(
//                         news[index].title.toUpperCase(),
//                         style: TextStyle(
//                           color: Colors.blue.shade800,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           letterSpacing: 1,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Container(
//                       padding: EdgeInsets.all(5),
//                       child: Text(
//                         news[index].content,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           letterSpacing: 1,
//                         ),
//                         textAlign: TextAlign.start,
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(5),
//                       alignment: Alignment.bottomRight,
//                       child: Text(
//                         '~ ${news[index].author}',
//                         style: TextStyle(
//                           color: Colors.blue.shade800,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           letterSpacing: 1,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//             itemCount: news.length,
//           ) : Center(
//             child: Text('Data is being fetched!'),
//           ),
//         ),
//       ),
//     );
//   }
// }