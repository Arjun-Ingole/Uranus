import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:uranus/models/sources.dart';

class PlayButton extends StatefulWidget {
  const PlayButton({Key? key}) : super(key: key);

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  @override

  bool isPlaying = false;
  final player = AudioPlayer();
  String source = KPOP;

  void initState() {
    super.initState();
    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(100)),
      child: Material(
        color: Colors.transparent,
        child: IconButton(
          onPressed: () async{
            if(isPlaying){
              await player.pause();
            } else {
              await player.play(source);
            }
          },
          icon: Icon(
            isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
            color: Color(0xffCF5167),
            size: 50,
          ),
        ),
      ),
    );
  }
}


