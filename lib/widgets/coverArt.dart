import 'package:flutter/material.dart';

Widget CoverArt() {
  return Padding(
    padding: EdgeInsets.all(25),
    child: ClipRRect(
      child: Image.asset('assets/test.jpg'),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
