import 'package:MediaPlayer/content/PlayButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:MediaPlayer/content/video.dart';

MediaApp() {
  FlutterStatusbarcolor.setStatusBarColor(Colors.black);

  //App Body
  var Body = Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [.2, .6, .9],
            colors: [Colors.black, Colors.black54, Colors.black]),
      ),
      child: TabBarView(
        children: <Widget>[
          Row(
            children: <Widget>[
              MediaButtons(),
            ],
          ),
          App(),
        ],
      ));

  var design = MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: Icon(
                Icons.play_circle_filled,
                color: Colors.blue.shade800,
                size: 40,
              ),
              title: Text("Media Player",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.audiotrack),
                    text: "Music",
                  ),
                  Tab(
                    icon: Icon(Icons.music_video),
                    text: "Video",
                  )
                ],
              ),
            ),
            body: Body,
          )));

  return design;
}
