import 'package:flutter/material.dart';
import 'package:jimmysservice/Pages/Rules%20Screen/rules_screen.dart';
import 'package:audioplayers/audioplayers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String? title;
  const MyHomePage({super.key, this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late AudioPlayer _audioPlayer;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.requestFocus();

    _audioPlayer = AudioPlayer();
    _playBackgroundMusic();
  }

  void _playBackgroundMusic() async {
    AssetSource myPath = AssetSource('audio/background_music.mp3');
    await _audioPlayer.setSource(myPath);
    _audioPlayer.setReleaseMode(ReleaseMode.loop);
    _audioPlayer.play(myPath);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  AppBar? homeTitle() {
    String? text = widget.title;

    return text != null
        ? AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(text),
          )
        : null;
  }

  VoidCallback? gotoRuleScreen() {
    return () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RulesScreen(music: _audioPlayer),
        ),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: gotoRuleScreen(),
        child: const Icon(Icons.arrow_forward),
      ),
      appBar: homeTitle(),
      body: Container(
        color: const Color.fromARGB(255, 204, 30, 30),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/frontpage.png"),
            ),
          ),
          child: const Center(),
        ),
      ),
    );
  }
}
