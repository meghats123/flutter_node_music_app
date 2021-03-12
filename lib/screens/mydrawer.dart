
import 'package:flutter/material.dart';
import 'package:flutter_node_music_app/screens/addmusic.dart';
import 'package:flutter_node_music_app/screens/delete.dart';
import 'package:flutter_node_music_app/screens/search.dart';
import 'package:flutter_node_music_app/screens/update.dart';
import 'package:flutter_node_music_app/screens/viewall.dart';



void main()=>runApp(MyDrawer());
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amber,

              ),
              accountName: Text("Megha"),
              accountEmail: Text("megha@gmail.com")),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder:(context)=> AddMusic()));
            },
            trailing: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder:(context)=> ViewMusics()));
            },
            trailing: Icon(Icons.add),
            title: Text("View Musics"),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder:(context)=> SearchMusic()));
            },
            trailing: Icon(Icons.add),
            title: Text("Search Musics"),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder:(context)=> DeleteMusic()));
            },
            trailing: Icon(Icons.add),
            title: Text("Delete Musics"),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder:(context)=> UpdateMusic()));
            },
            trailing: Icon(Icons.add),
            title: Text("Update Musics"),
          ),



        ],
      ),
    );
  }
}
