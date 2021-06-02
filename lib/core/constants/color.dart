import 'package:flutter/material.dart';

const elPrimaryColorHex = 0xFFF79F08;

const Map<int, Color> elPrimaryColor = {
  50: Color.fromRGBO(247, 159, 8, 0.1),
  100: Color.fromRGBO(247, 159, 8, .2),
  200: Color.fromRGBO(247, 159, 8, .3),
  300: Color.fromRGBO(247, 159, 8, .4),
  400: Color.fromRGBO(247, 159, 8, .5),
  500: Color.fromRGBO(247, 159, 8, .6),
  600: Color.fromRGBO(247, 159, 8, .7),
  700: Color.fromRGBO(247, 159, 8, .8),
  800: Color.fromRGBO(247, 159, 8, .9),
  900: Color.fromRGBO(247, 159, 8, 1),
};

const MaterialColor elPrimaryMaterialColor =
    MaterialColor(elPrimaryColorHex, elPrimaryColor);
