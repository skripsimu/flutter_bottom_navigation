import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation/pages/home.dart';
import 'package:flutter_bottom_navigation/pages/Profile.dart';
import 'package:flutter_bottom_navigation/pages/news.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Demo BottomNav'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //page controller
  PageController _pageController;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: PageView(
            children: <Widget>[Home(),News(), Profile()],
            controller: _pageController,
            onPageChanged: onPageChanged,

      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: new Icon(
                IconData(0xe800, fontFamily: 'typicons'),
              ),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(
                IconData(0xe801, fontFamily: 'typicons'),
              ),
              title: new Text('Messages'),
            ),
            BottomNavigationBarItem(
                icon: new Icon(
                  IconData(0xe802, fontFamily: 'typicons'),
                ),
                title: Text('Profile')
            )
          ],
        onTap: onTap,
        currentIndex: page,
        fixedColor: Colors.blue,
      ),
    );
  }

  void initState(){
    super.initState();
    _pageController = PageController(initialPage: this.page);
  }
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }
  void onTap(int index){
    _pageController.animateToPage(index, duration: const Duration(microseconds: 200), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }
}
