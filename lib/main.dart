import 'package:flutter/material.dart';
import 'package:interview/data/mock_data.dart';
import 'package:interview/data/user.dart';
import 'package:interview/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Interview',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Welcome to the Interview'),
    );
  }
}


