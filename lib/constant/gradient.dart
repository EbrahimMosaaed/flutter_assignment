import 'package:flutter/material.dart';

var pinkgradient= LinearGradient(
  colors: [Colors.black38,Colors.pinkAccent],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: [0.0,1.0],
  tileMode: TileMode.clamp

);

var yellowgradient= LinearGradient(
  colors: [Colors.yellow,Colors.indigo],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: [0.0,1.0],
  tileMode: TileMode.clamp

);

var greyGradintForNotloading= LinearGradient(
  colors: [Colors.grey,Colors.blue],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: [0.0,1.0],
  tileMode: TileMode.clamp

);