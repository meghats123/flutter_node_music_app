import 'package:flutter/material.dart';
import 'package:flutter_node_music_app/models/music.dart';
import 'package:flutter_node_music_app/screens/mydrawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
class ViewMusics extends StatefulWidget {
  @override
  _ViewMusicsState createState() => _ViewMusicsState();
}

class _ViewMusicsState extends State<ViewMusics> {

  Future<Music>getData(String apiLink)async{
    return http.get(apiLink).then((http.Response response){
      print(response.body.toString());
      musics=json.decode(response.body);
      return json.decode(response.body);
    });
  }
  List musics=[];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("View Musics"),
          backgroundColor: Colors.deepOrange,
        ),
        drawer: MyDrawer(),
        body: Container(
          child: ListView.builder(
              itemCount: musics.length==null?0:musics.length, itemBuilder: (context,index){
            return Card(
              elevation: 10.0,
              child: ListTile(
                leading: Icon(Icons.account_circle_outlined),
                title: Text(musics[index]["song"].toString()),
                subtitle: Text("musicdirector :"+musics[index]["musicdirector"].toString()+"\n"+"singers :"+musics[index]["singers"].toString()+"\n"+"Year Of Release :"+musics[index]["yearofrelease"].toString()),
              ),

            );
          }),
        ),
      ),
    );
  }

  @override

  void initState() {
    getData("https://nodejsmusicapp.herokuapp.com/viewallMusic");
  }
}

