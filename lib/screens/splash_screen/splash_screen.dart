import 'package:video_player/video_player.dart';

import '../../constants/consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

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
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Text("Learn Html" , style: TextStyle(color: redColor , fontSize: 30 , fontWeight: FontWeight.bold),),
                const SizedBox(height: 30,),
                Center(
                  child: _controller.value.isInitialized
                      ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(
                      _controller,
                    ),
                  )
                      : Container(),
                ),
                const Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Text("Version : 1.1.0" , style: TextStyle(color: Colors.white , fontSize: 16 , fontWeight: FontWeight.w400),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
