import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jimmysservice/Pages/Rules%20Screen/rules_screen.dart';

void main() {
  runApp(const MyApp());
}

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
      home: const MyHomePage(
        title: "Jimmys service",
      ),
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
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeTitle(),
      body: Container(
        color: Colors.grey,
        child: Center(
          child: KeyboardListener(
            focusNode: _focusNode,
            autofocus: true,
            onKeyEvent: (value) {
              if (value is KeyDownEvent) {
                if (value.logicalKey == LogicalKeyboardKey.keyB) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RulesScreen()),
                  );
                }
              }
            },
            child: Card(
                child: SizedBox(
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Welcome to Mindo",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Text(
                    "Press B to recall",
                  ),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
