import 'package:flutter/material.dart';

class Global {
  static final colors = _Colors();
  static final fonts = _Fonts();
}

class _Colors {
  final lightIconColor = const Color(0XFFE7EAEB);
  late final lightIconColorDarker =
      HSLColor.fromColor(lightIconColor).withLightness(0.55).toColor();
  final darkIconColor = const Color(0XFF323031);
  late final darkIconColorLighter =
      HSLColor.fromColor(darkIconColor).withLightness(0.75).toColor();
  final defaultBackgroundColor = const Color(0XFF223843);
  late final defaultContentColor = lightIconColor;
}

class _Fonts {
  final Map<String, String> fontMap = const {
    'Default': 'Default',
    'LibreBaskerville': 'Baskerville',
    'CarnivaleeFreakshow': 'Carnivalee Freakshow',
    'ComicNeue': 'Comic Neue',
    'GoodTimes': 'Good Times',
    'Roboto': 'Roboto',
    'LuxuriousRoman': 'Luxurious Roman',
    'Starjedi': 'Not Starwars',
    'Sunnyspells': 'Sunnyspells',
    'NewWaltDisney': 'Not Disney',
    'DiarioDeAndy': 'Diario De Andy'
  };
}
