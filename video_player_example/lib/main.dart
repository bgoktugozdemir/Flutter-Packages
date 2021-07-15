import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  VideoPlayerController _videoPlayerController;
  String _screenText = "Welcome";
  Timer _timer;
  var _dataSource =
      'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4';
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(_dataSource)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _videoPlayerController.play(); // Play video when app started.
    _videoPlayerController.setLooping(true); // Loop
    _videoPlayerController.setVolume(0.5); // Default volume. 0 <= volume <= 1
    Timer.periodic(Duration(seconds: 15), (Timer t) {
      setState(() {
        _screenText = DateTime.now().toString();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Center(
              child: _videoPlayerController.value.initialized
                  ? AspectRatio(
                      aspectRatio: _videoPlayerController.value.aspectRatio,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor
                        ),
                        child: VideoPlayer(_videoPlayerController),
                      ),
                    )
                  : Container(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Container(
                    child: Text(
                      _screenText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _videoPlayerController.value.isPlaying
                ? _videoPlayerController.pause()
                : _videoPlayerController.play();
          });
        },
        child: Icon(
          _videoPlayerController.value.isPlaying
              ? Icons.pause
              : Icons.play_arrow,
        ),
      ),
    );
  }
}
