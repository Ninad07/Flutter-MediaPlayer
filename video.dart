import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:MediaPlayer/content/URL.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String textValue = "Sample";
  VideoPlayerController videoController;
  Future<void> videoPlayer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20.0),
          child: TextField(
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Enter URL',
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
              setState(() {
                textValue = value;
              });
            },
          ),
        ),
        Card(
          color: Colors.blue.shade800,
          child: FlatButton(
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.white,
              size: 50,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PlayVideo(
                      url: textValue,
                    );
                  },
                ),
              );
            },
          ),
          elevation: 30,
        ),
        Container(
          margin: EdgeInsets.only(top: 80, bottom: 20),
          height: 400,
          width: 400,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Card(
                  color: Colors.black,
                  margin:
                      EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 1),
                  shadowColor: Colors.black,
                  elevation: 5,
                  child: Center(
                    child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(25),
                        height: 200,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            border: Border.all(color: Colors.black, width: 1)),
                        child: FlickVideoPlayer(
                          flickManager: FlickManager(
                            autoPlay: false,
                            autoInitialize: true,
                            //getPlayerControlsTimeout: fun,
                            videoPlayerController:
                                VideoPlayerController.asset('video/Batman.mp4'),
                          ),
                        )),
                  )),
            ],
          ),
        )

        /*
        FutureBuilder(
          future: videoPlayer,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: AspectRatio(
                  aspectRatio: videoController.value.aspectRatio,
                  child: VideoPlayer(videoController),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        /*SizedBox(
          height: 30.0,
        ),*/
        FloatingActionButton(
          onPressed: () {
            setState(() {
              if (videoController.value.isPlaying) {
                videoController.pause();
              } else {
                videoController.play();
              }
            });
          },
          child: Icon(
              videoController.value.isPlaying ? Icons.pause : Icons.play_arrow),
        ),*/
      ],
    );
  }
}
