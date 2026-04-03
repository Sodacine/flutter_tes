import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pertemuan 1',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplikasi Pertamaku, Rangga Satria'),
          backgroundColor: Colors.blue,
        ),
        body: Center(child: Text('Hello World')),
      ),
    );
  }
} 