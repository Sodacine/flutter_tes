import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static final title = 'Rangga Satria Kencana';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> _page = [
    Container(color: Colors.red),
    Container(color: Colors.blueAccent),
    Container(color: Colors.blueGrey),
    Container(color: Colors.grey),
    Container(color: Colors.greenAccent),
  ];

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: MyApp.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          backgroundColor: Colors.blue,
        ),
        body: _page[_currentIndex],
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Beranda
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text('Beranda'),
              selectedColor: Colors.red,
            ),

            /// Kalendar
            SalomonBottomBarItem(
              icon: Icon(Icons.calendar_month),
              title: Text('Kalendar'),
              selectedColor: Colors.blueAccent,
            ),

            /// Maps
            SalomonBottomBarItem(
              icon: Icon(Icons.approval_rounded),
              title: Text('Maps'),
              selectedColor: Colors.blueGrey,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
              selectedColor: Colors.grey,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              selectedColor: Colors.greenAccent,
            ),
          ],
        ),
      ),
    );
  }
}