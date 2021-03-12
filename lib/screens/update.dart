import 'package:flutter/material.dart';
import 'package:flutter_node_music_app/models/music.dart';
import 'package:flutter_node_music_app/screens/mydrawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
class UpdateMusic extends StatefulWidget {
  @override
  _UpdateMusicState createState() => _UpdateMusicState();
}

class _UpdateMusicState extends State<UpdateMusic> {
  Future<Music>updateData(String apiLink,{Map body})async{
    return http.post(apiLink,body:body).then((http.Response response){
      print(response.body);
      return json.decode(response.body);
    });
  }
  Future<Music>deleteData(String apiLink,songid)async{
    return http.post(apiLink,body:songid).then((http.Response response){
      print(response.body);
      var result=json.decode(response.body);
      setState(() {
        musicdirector.text="";
        singers.text="";
        yearofrelease.text="";

      });
      return result;
    });
  }
  Future<Music>searchData(String apiLink,song)async{
    return http.post(apiLink,body:song).then((http.Response response){
      print(response.body);
      var result=json.decode(response.body);
      if(result.length==0)
      {
        print("Invalid Song");
        song1.text="";
        musicdirector.text="";
        singers.text="";
        yearofrelease.text="";

      }
      else{
        var getSong=result[0]['song'].toString();
        var getMusicDirector=result[0]['musicdirector'].toString();
        var getSingers=result[0]['singers'].toString();
        var getYearofrelease=result[0]['yearofrelease'].toString();
        getId=result[0]["_id"].toString();
        setState(() {
          song1.text=getSong;
          musicdirector.text=getMusicDirector;
          singers.text=getSingers;
          yearofrelease.text=getYearofrelease;
        });
      }
      return json.decode(response.body);
    });
  }
  TextEditingController song=TextEditingController();
  TextEditingController song1=TextEditingController();
  TextEditingController musicdirector=TextEditingController();
  TextEditingController singers=TextEditingController();
  TextEditingController yearofrelease=TextEditingController();
  var getId="";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Update Musics"),
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
                  color: Colors.deepOrange,
                ),
                TextField(
                  controller: song1,
                  decoration: InputDecoration(
                      labelText: "Song",
                      hintText: "Song",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10.0,),
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
                SizedBox(height: 10.0,),
                FlatButton(onPressed: (){
                  print(getId);
                  var result=deleteData("https://nodejsmusicapp.herokuapp.com/delete",{"id":getId});

                },
                  child: Text("DELETE"),
                  color: Colors.deepOrange,

                ),
                SizedBox(height: 10.0,),
                FlatButton(onPressed: () async {
                 var newSong=song1.text;
                 var newMusicDirector=musicdirector.text;
                 var newSingers=singers.text;
                 var newYearofrelease=yearofrelease.text;
                 Music musicdata=new Music(
                   id:getId,
                     song:newSong,
                     musicdirector:newMusicDirector,
                     singers:newSingers,
                     yearofrelease:newYearofrelease
                 );
                 Music datatosend=await updateData("https://nodejsmusicapp.herokuapp.com/update",body: musicdata.toJson());

                },
                  child: Text("UPDATE"),
                  color: Colors.deepOrange,

                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
