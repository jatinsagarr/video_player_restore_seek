import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chewie/chewie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse("https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"),
        formatHint: VideoFormat.hls)
      ..initialize().then((value) {
        setState(() {
          _chewieController = ChewieController(
            videoPlayerController: _controller,
            looping: false,
            autoInitialize: true,
            showControls: true,
            autoPlay: false,
          );

          setProgress();
          _controller.addListener(progress);
        });
      });
  }

  void setProgress() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await _chewieController
        .seekTo(Duration(seconds: prefs.getInt("time") ?? 0));
  }

  void progress() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('time', _controller.value.position.inSeconds);
    //print("Printing :::: ${_controller.value.position.inSeconds}");
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Chewie(controller: _chewieController),
              )
            : const CircularProgressIndicator(
                color: Colors.purple,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
