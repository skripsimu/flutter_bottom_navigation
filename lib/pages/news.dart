import 'package:flutter/material.dart';

class News extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: Container(
          child: Center(
            child: Text("News"),
          ),
        ),
      ),
    );
  }
}