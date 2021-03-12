import 'package:flutter/material.dart';
import 'package:flutter_node_music_app/models/music.dart';
import 'package:flutter_node_music_app/screens/mydrawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
class SearchMusic extends StatefulWidget {
  @override
  _SearchMusicState createState() => _SearchMusicState();
}

class _SearchMusicState extends State<SearchMusic> {
  Future<Music>searchData(String apiLink,song)async{
    return http.post(apiLink,body:song).then((http.Response response){
      print(response.body);
      var result=json.decode(response.body);
      if(result.length==0)
      {
        print("Invalid Song");
        song.text="";
        musicdirector.text="";
        singers.text="";
        yearofrelease.text="";

      }
      else{
        var getMusicDirector=result[0]['musicdirector'];
        var getSingers=result[0]['singers'];
        var getYearofrelease=result[0]['yearofrelease'].toString();
        setState(() {
          musicdirector.text=getMusicDirector;
          singers.text=getSingers;
          yearofrelease.text=getYearofrelease;
        });
      }
      return json.decode(response.body);
    });
  }
  TextEditingController song=TextEditingController();
  TextEditingController musicdirector=TextEditingController();
  TextEditingController singers=TextEditingController();
  TextEditingController yearofrelease=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Search Musics"),
          backgroundColor: Colors.deepOrange,
        ),
        drawer: MyDrawer(),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: song,
                  decoration: InputDecoration(
                      labelText:"Song",
                      hintText: "Song",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10.0,),
                RaisedButton(onPressed: (){
                  var getSong=song.text.toString();
                  var result=searchData("https://nodejsmusicapp.herokuapp.com/search",{"song":getSong});
                  print(result);

                },
                  child: Text("SEARCH"),
                  color: Colors.green,
                ),
                TextField(
                  controller: musicdirector,
                  decoration: InputDecoration(
                      labelText: "Music Director",
                      hintText: "Music Director",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10.0,),
                TextField(
                  controller: singers,
                  decoration: InputDecoration(
                      labelText: "Singers",
                      hintText: "Singers",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10.0,),
                TextField(
                  controller: yearofrelease,
                  decoration: InputDecoration(
                      labelText: "Year of Release",
                      hintText: "Year of Release",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10.0,)



              ],
            ),
          ),
        ),
      ),
    );
  }
}
