import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';

class PlayVideo extends StatelessWidget {
  PlayVideo({this.url});

  final url;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: GetVideo(
          link: url,
        ),
      ),
    );
  }
}

class GetVideo extends StatefulWidget {
  GetVideo({this.link});
  final link;
  @override
  _GetVideoState createState() => _GetVideoState();
}

class _GetVideoState extends State<GetVideo> {
  YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    initialize(widget.link);
  }

  void initialize(dynamic link) {
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(link));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Youtube Player"),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              YoutubePlayer(
                controller: controller,
                showVideoProgressIndicator: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
