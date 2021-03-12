
import 'package:flutter/material.dart';
import 'package:flutter_node_music_app/screens/addmusic.dart';

void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: AddMusic(),
      ),
    );
  }
}
