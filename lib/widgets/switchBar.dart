import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget SwitchBar() {
  return Container(
    height: 50,
    width: double.infinity,
    margin: const EdgeInsets.only(
      right: 25,
      left: 25,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: Color(0x8C202020),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customButton(Color(0xff2C2C2C), 'JPOP'),
        customButton(Color(0xffCF5167), 'KPOP'),
        customButton(Color(0xff2C2C2C), 'LOFI'),
      ],
    ),
  );
}

Widget customButton(Color color, String category) {
  return Container(
    height: 50,
    width: 100,
    margin: EdgeInsets.all(7),
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(10.0)),
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
  );
}
