import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XilophonePage());
}

class XilophonePage extends StatelessWidget {
  const XilophonePage({Key? key}) : super(key: key);

  void playSound(int soundNumber) async{
    final player = AudioPlayer();
    await player.setSource(AssetSource('audio/note$soundNumber.wav'));
    await player.resume();
  }
  Expanded buildKey({required int soundNumber, required MaterialColor color}){
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(soundNumber);
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              buildKey(color: Colors.red , soundNumber: 1),
              buildKey(color: Colors.orange , soundNumber: 2),
              buildKey(color: Colors.yellow , soundNumber: 3),
              buildKey(color: Colors.green , soundNumber: 4),
              buildKey(color: Colors.blue , soundNumber: 5),
              buildKey(color: Colors.purple , soundNumber: 6),
              buildKey(color: Colors.pink, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
