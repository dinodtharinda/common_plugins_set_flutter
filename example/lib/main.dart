import 'package:flutter/material.dart';
import 'package:common_plugin_set/common_plugin_set.dart';
import 'package:common_plugin_set/src/message.g.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Book book = Book(title: "no book", author: "no auther");
  double sum = 0;

  @override
  void initState() {
    super.initState();

    fetchData();
  }
  

  void fetchData()async{
    var b =  await CommonPluginSet.shared.fetchBook("asdf");
    var s = await CommonPluginSet.shared.sum(12, 10.5);
    setState(() {
      book = b;
      sum = s;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:  Text(book.title?? "no title")),
        body: Column(
          children: [
            Center(child: Text(book.author ?? "no auther")),
            Center(child: Text(sum.toString()))
          ],
        ),
      ),
    );
  }
}