import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwitchBar extends StatefulWidget {
  const SwitchBar({Key? key}) : super(key: key);

  @override
  State<SwitchBar> createState() => _SwitchBarState();
}

class _SwitchBarState extends State<SwitchBar> {
  MusicSource? selectedSource;
  Color InActivecolor = Color(0xff2C2C2C);
  Color Activecolor = Color(0xffCF5167);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(
        right: 25,
        left: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customButton(
              selectedSource == MusicSource.JPOP ? Activecolor : InActivecolor,
              'JPOP', () {
            setState(() {
              selectedSource = MusicSource.JPOP;
            });
          }),
          customButton(
              selectedSource == MusicSource.KPOP ? Activecolor : InActivecolor,
              'KPOP', () {
            setState(() {
              selectedSource = MusicSource.KPOP;
            });
          }),
        ],
      ),
    );
  }
}

Widget customButton(Color colour, String category, VoidCallback onPressed) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 100,
        margin: EdgeInsets.all(7),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(24.0)),
        child: Center(
          child: Material(
            child: Text(
              category,
              style: TextStyle(
                  fontFamily: GoogleFonts.epilogue().fontFamily,
                  fontSize: 20,
                  color: Colors.white),
            ),
            color: Colors.transparent,
          ),
        ),
      ),
    ),
  );
}

enum MusicSource {
  KPOP,
  JPOP,
}
