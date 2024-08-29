import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Xylophone',
            style: TextStyle(color: Colors.white), // AppBar font color white
          ),
          backgroundColor: const Color(0xFF49243E), // AppBar color
        ),
        body: const Xylo(),
      ),
    );
  }
}

class Xylo extends StatefulWidget {
  const Xylo({super.key});

  @override
  State<Xylo> createState() => _XyloState();
}

class _XyloState extends State<Xylo> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  final Map<int, Color> _buttonColors = {
    1: const Color(0xFF49243E),
    2: const Color(0xFF704264),
    3: const Color(0xFFBB84993),
    4: const Color(0xFFDBAFA0),
  };

  void playSound(int num) async {
    await _audioPlayer.play(AssetSource('note$num.wav'));
  }

  Widget createNewButton(int sound, Color color, String name) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton(
          onPressed: () {
            playSound(sound);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: color, // Button color
            shape: const StadiumBorder(), // Leaf-like shape
            padding: const EdgeInsets.symmetric(vertical: 22.0), // Reduced button height slightly
          ),
          child: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/fff.jpg'), // Background image
          fit: BoxFit.cover, // Cover the entire scaffold
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          createNewButton(1, _buttonColors[1]!, "啊 (Ā)"),
          createNewButton(2, _buttonColors[2]!, "贝 (Bèi)"),
          createNewButton(3, _buttonColors[3]!, "西 (Xī)"),
          createNewButton(4, _buttonColors[4]!, "德 (Dé)"),
        ],
      ),
    );
  }
}
