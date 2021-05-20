import 'package:flutter/material.dart';
import 'package:flutter_testt/api/ApiConstants.dart';
import 'package:flutter_testt/utils/color_utils.dart';
import 'package:flutter_testt/utils/custom_appbar.dart';
import 'package:flutter_testt/utils/global.dart';
import 'package:video_player/video_player.dart';

class PlaySoccer extends StatefulWidget {
  @override
  _PlaySoccerState createState() => _PlaySoccerState();
}

class _PlaySoccerState extends State<PlaySoccer> {
  VideoPlayerController _playerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _playerController = VideoPlayerController.network(
        // "https://1binhluanvidamme.phut91.online/6075cc6205dcc9002a3c6e93.html?jwsource=cl")
      // ApiConstants.BASE_URL + ApiConstants.LINK_STREAM)
        "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4")
      // "https://video-5a.gapo.vn/videos/results/882e7054-f182-43db-9fe7-6e76c095436c/480p/file18.ts")
      ..initialize().then((_) => {
      setState(() {})

      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarDefault(context, ""),
      body: Center(
        child: _playerController.value.initialized
            ? AspectRatio(
                aspectRatio: _playerController.value.aspectRatio,
                child: VideoPlayer(_playerController),
              )
            : Container(
          height: 100,
          color: ColorUtils.red1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _playerController.value.isPlaying
                ? _playerController.pause()
                : _playerController.play();
          });
        },
        child: Icon(
          _playerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _playerController.dispose();
  }
}
