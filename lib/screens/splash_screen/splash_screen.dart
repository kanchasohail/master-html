// import 'package:flutter/scheduler.dart';
import 'package:video_player/video_player.dart';

import '../../constants/consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late VideoPlayerController _controller;

  // late final bool isDarkMode ;

  @override
  void initState() {
    super.initState();

    // isDarkMode = SchedulerBinding.instance.window.platformBrightness == Brightness.dark;

    _controller = VideoPlayerController.asset('assets/animated_logo.mp4')
      ..initialize().then((_) => setState(() {}))
      ..setVolume(0.0);
    playVideo() ;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<void> playVideo() async {
    _controller.play() ;
    // await Future.delayed(const Duration(seconds: 3));
    // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: isDarkMode ? const Color(0xff303031) : const Color(0xffFFFFFF),
        backgroundColor: const Color(0xffFFFFFF),
        body: SafeArea(
          child: Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(
                _controller,
              ),
            )
                : Container(),
          ),
        ),
      ),
    );
  }
}
