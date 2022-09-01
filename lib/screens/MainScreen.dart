import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uranus/widgets/coverArt.dart';
import 'package:uranus/widgets/playButton.dart';
import 'package:uranus/widgets/switchBar.dart';

class MainScreen extends StatefulWidget {
  MainScreen(
      {required this.URL,
      required this.Song_Title,
      required this.Artist,
      required this.Accent_Color});
  String URL;
  String Song_Title;
  String Artist;
  Color Accent_Color;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          widget.Accent_Color,
          Color(0xff000000),
          Color(0xff000000),
        ],
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CoverArt(
            url: widget.URL,
          ),
          SwitchBar(Accent_Color: widget.Accent_Color),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Material(
              color: Colors.transparent,
              child: Text(
                widget.Song_Title,
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: GoogleFonts.epilogue().fontFamily,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: Text(
              widget.Artist,
              style: TextStyle(
                fontSize: 20,
                fontFamily: GoogleFonts.epilogue().fontFamily,
                color: Colors.white,
              ),
            ),
          ),
          PlayButton(Accent_Color: widget.Accent_Color),
        ],
      ),
    );
  }
}
