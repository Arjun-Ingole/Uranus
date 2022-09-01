import 'package:flutter/material.dart';

class CoverArt extends StatefulWidget {
  CoverArt({required this.url});
  String url;
  @override
  State<CoverArt> createState() => _CoverArtState();
}

class _CoverArtState extends State<CoverArt> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(25),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FittedBox(
          alignment: Alignment.center,
          fit: BoxFit.cover,
          child: Image.network(widget.url),
          clipBehavior: Clip.hardEdge,
        ),
      ),
    );
  }
}
