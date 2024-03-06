import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    flutterTts.setLanguage("fr-FR"); // Définissez la langue selon vos besoins
  }

  Future<void> speak(String text) async {
    await flutterTts.setVolume(1.0);
    await flutterTts
        .setSpeechRate(0.5); // Ajustez la vitesse selon vos préférences
    await flutterTts.setPitch(1.0);
    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text-to-Speech'),
      ),
      body: Center(
        child: InkWell(
          child: Text('Cliquez ici', style: TextStyle(fontSize: 20)),
          onTap: () {
            speak('this is my book'); // Remplacez le texte par le vôtre
          },
        ),
      ),
    );
  }
}
