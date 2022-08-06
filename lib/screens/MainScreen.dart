import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uranus/widgets/coverArt.dart';
import 'package:uranus/widgets/playButton.dart';
import 'package:uranus/widgets/switchBar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color(0x00EF5D77),
                Color(0xff000000),
              ],
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            coverArt(),
            SwitchBar(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Material(
                color: Colors.transparent,
                child: Text(
                  'Into The Night',
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
                'Yoasobi -  夜に駆ける',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: GoogleFonts.epilogue().fontFamily,
                  color: Colors.white,
                ),
              ),
            ),
            PlayButton(),
          ],
        ),
      ),
    );
  }
}