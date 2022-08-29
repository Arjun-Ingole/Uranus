import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:uranus/models/SocketData.dart';

MusicData? data;

Future<Color> getColor(String url) async {
  Image img = Image.network(url);
  return await _updatePaletteGenerator(img);
}

Future<Color> _updatePaletteGenerator(Image img) async {
  PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
    img.image,
  );
  return paletteGenerator.dominantColor!.color;
}
