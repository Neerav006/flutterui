
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerSample extends StatefulWidget  {

  @override
  _VideoPlayerSampleState createState() => _VideoPlayerSampleState();
}

class _VideoPlayerSampleState extends State<VideoPlayerSample> with WidgetsBindingObserver {


  VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _onControllerChange('http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _videoPlayerController.value.initialized
          ? AspectRatio(
        aspectRatio: _videoPlayerController.value.aspectRatio,
        child: VideoPlayer(_videoPlayerController),
      )
          : CircularProgressIndicator(),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.resumed){
      // user returned to our app
      setState(() {

        _videoPlayerController?.play();

      });
    }else if(state == AppLifecycleState.inactive){
      // app is inactive
    }else if(state == AppLifecycleState.paused){
      print("video paused");
      setState(() {
        _videoPlayerController?.pause();

      });
      // user is about quit our app temporally
    }
  }

  void _initController(String link) {
    _videoPlayerController = VideoPlayerController.network(link)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  Future<void> _onControllerChange(String link) async {
    if (_videoPlayerController == null) {
      // If there was no controller, just create a new one
      _initController(link);
    } else {
      // If there was a controller, we need to dispose of the old one first
      final oldController = _videoPlayerController;

      // Registering a callback for the end of next frame
      // to dispose of an old controller
      // (which won't be used anymore after calling setState)
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await oldController.dispose();

        // Initing new controller
        _initController(link);
      });

      // Making sure that controller is not used by setting it to null
      setState(() {
        _videoPlayerController = null;
      });
    }
  }
}
