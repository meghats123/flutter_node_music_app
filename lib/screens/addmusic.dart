import 'package:flutter/material.dart';
import 'package:flutter_node_music_app/models/music.dart';
import 'package:flutter_node_music_app/screens/mydrawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
Future<Music>sendData(String apiLink,{Map body})async{
  return http.post(apiLink,body:body).then((http.Response response){
    print(response.body);
    return json.decode(response.body);
  });
}
class AddMusic extends StatefulWidget {
  @override
  _CheckAppState createState() => _CheckAppState();
}

class _CheckAppState extends State<AddMusic> {
  TextEditingController Song=TextEditingController();
  TextEditingController MusicDirector=TextEditingController();
  TextEditingController Singers=TextEditingController();
  TextEditingController YearofRelease=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("MUSIC APP"),
          backgroundColor: Colors.deepOrange,
        ),
        drawer: MyDrawer(),
        body: Container(
          padding: EdgeInsets.all(10.0),

          child: SingleChildScrollView(
            child: Column(

              children: [

                TextField(
                  controller: Song,
                  decoration: InputDecoration(
                    labelText: "Song",
                      hintText: "Song",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10.0,),
                TextField(
                  controller: MusicDirector,
                  decoration: InputDecoration(
                    labelText: "Music Director",
                      hintText: "Music Director",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10.0,),
                TextField(
                  controller: Singers,
                  decoration: InputDecoration(
                    labelText: "Singers",
                      hintText: "Singers",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10.0,),
                TextField(
                  controller: YearofRelease,
                  decoration: InputDecoration(
                    labelText: "Year Of Release",
                      hintText: "YearofRelease",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10.0,),
                RaisedButton(onPressed: () async {
                  var getSong=Song.text;
                  var getMusicDirector=MusicDirector.text;
                  var getSingers=Singers.text;
                  var getYearofRelease=YearofRelease.text;
                  Music musicdata=new Music(
                      song:getSong,
                      musicdirector:getMusicDirector,
                      singers:getSingers,
                      yearofrelease:getYearofRelease
                  );

                  Music datatosend=await sendData("https://nodejsmusicapp.herokuapp.com/addMusic",body: musicdata.toJson());

                },
                  color: Colors.deepOrange,
                  child: Text("SUBMIT"),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
