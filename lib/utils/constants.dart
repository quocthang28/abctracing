import 'package:flutter/material.dart';

const int kModelInputSize = 28;
const double kCanvasInnerOffset = 40.0;
const double kCanvasSize = 300.0;
const double kStrokeWidth = 20.0;
const Color kBlackBrushColor = Colors.black;
const bool kIsAntiAlias = true;
const Color kBrushBlack = Colors.white;
const Color kBrushWhite = Colors.white;

//pen 
final Paint kDrawingPaint = Paint()
  ..strokeCap = StrokeCap.round
  ..isAntiAlias = kIsAntiAlias
  ..color = Colors.white
  ..strokeWidth = kStrokeWidth;

//image pen
final Paint kPaint = Paint()
..strokeCap = StrokeCap.round
..isAntiAlias = true
..color = Colors.white
..strokeWidth = kStrokeWidth;

//image background
final kBackgroundPaint = Paint()..color = Colors.black;

final Paint kWhitePaint = Paint()
  ..strokeCap = StrokeCap.round
  ..isAntiAlias = kIsAntiAlias
  ..color = kBrushWhite
  ..strokeWidth = kStrokeWidth;

const kCacheDirectoryName = 'cachedImages';
