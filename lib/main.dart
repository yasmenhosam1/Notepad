import 'package:flutter/material.dart';
import 'package:flutter_noteapp/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Notes',
      theme: ThemeData(
        
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.light
      ),
      home:  const homescreen(),
    );
  }
}
