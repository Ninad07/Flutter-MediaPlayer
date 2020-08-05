import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

PlayToast() {
  Fluttertoast.showToast(
      msg: "Playing Audio",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0);
}

netPlayToast() {
  Fluttertoast.showToast(
      msg: "Playing Audio from the network",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0);
}

PauseToast() {
  Fluttertoast.showToast(
      msg: "Paused",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0);
}

netpauseToast() {
  Fluttertoast.showToast(
      msg: "Paused Network Audio",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0);
}

stopToast() {
  Fluttertoast.showToast(
      msg: "Stopped Audio",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0);
}

netStopToast() {
  Fluttertoast.showToast(
      msg: "Stopped Network Audio",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0);
}

AudioPlayer advancedPlayer = AudioPlayer();
AudioPlayer networkPlayer = AudioPlayer();

class path {
  static String filePath = 'sample';
}

class AudioUrl {
  static String audioUrl = "sample";
}

Future pause() async {
  PauseToast();
  await advancedPlayer.pause();
}

Future stop() async {
  stopToast();
  await advancedPlayer.stop();
}

Future netPlay() async {
  netPlayToast();
  var audio = await networkPlayer.play(AudioUrl.audioUrl);
  Text("Playing network Audio");
}

Future netPause() async {
  netpauseToast();
  await networkPlayer.pause();
}

Future netStop() async {
  netStopToast();
  await networkPlayer.stop();
}

bool isPlaying = false;

MediaButtons() {
  var Play = Column(
    children: <Widget>[
      Card(
        color: Colors.grey.shade900,
        elevation: 15,
        margin: EdgeInsets.only(top: 20, left: 20),
        child: Container(
          margin: EdgeInsets.all(20),
          height: 250,
          width: 300,
          child: Icon(
            Icons.queue_music,
            color: Colors.white,
            size: 250,
          ),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          //color: Colors.grey.shade800,
        ),
      ),
      Row(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 30, top: 25, bottom: 25),
              child: GestureDetector(
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.grey.shade700,
                  elevation: 25,
                  isExtended: true,
                  label: Icon(
                    Icons.pause,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: pause,
                ),
                onLongPress: netPause,
              )),
          Container(
              margin: EdgeInsets.only(top: 25, right: 43, left: 45, bottom: 25),
              child: GestureDetector(
                child: FloatingActionButton.extended(
                    backgroundColor: Colors.grey.shade700,
                    elevation: 15,
                    isExtended: true,
                    label: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () async {
                      int status = await advancedPlayer.play(path.filePath,
                          isLocal: true);
                      PlayToast();
                    }),
                onLongPress: netPlay,
              )),
          Container(
              margin: EdgeInsets.only(right: 15, top: 25, bottom: 25),
              child: GestureDetector(
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.grey.shade700,
                  elevation: 15,
                  isExtended: true,
                  label: Icon(
                    Icons.stop,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: stop,
                ),
                onLongPress: netStop,
              ))
        ],
      ),
      Card(
        margin: EdgeInsets.only(
          left: 15,
        ),
        color: Colors.blue.shade800,
        borderOnForeground: false,
        elevation: 20,
        child: FloatingActionButton.extended(
          backgroundColor: Colors.blue.shade800,
          elevation: 0,
          isExtended: true,
          label: Text(
            "Select Audio",
            textAlign: TextAlign.center,
          ),
          onPressed: () async {
            path.filePath = await FilePicker.getFilePath();
          },
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        width: 380,
        margin: EdgeInsets.only(top: 20, bottom: 20, left: 15),
        child: TextField(
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Enter the URL',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (value) {
            AudioUrl.audioUrl = value;
          },
        ),
      )
    ],
  );

  return Play;
}
