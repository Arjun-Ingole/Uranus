import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:uranus/models/sources.dart';
import 'switchBar.dart';

String source = JPOP;
final player = AudioPlayer();

void getSource() {
  if (selectedSource == MusicSource.JPOP) {
    source = JPOP;
  } else if (selectedSource == MusicSource.KPOP) {
    source = KPOP;
  }
}

void switchSource() {
  player.stop();
}

class PlayButton extends StatefulWidget {
  PlayButton({required this.Accent_Color});

  @override
  Color Accent_Color;
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  @override
  bool isPlaying = false;

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
          onPressed: () async {
            if (isPlaying) {
              await player.stop();
            } else {
              await player.play(source);
            }
          },
          icon: Icon(
            isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
            color: widget.Accent_Color,
            size: 50,
          ),
        ),
      ),
    );
  }
}
