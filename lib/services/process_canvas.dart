import 'dart:ui';
import 'dart:io';
import 'dart:typed_data';
import 'package:text_reg/utils/constants.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:path_provider/path_provider.dart';

class ProcessCanvasService {
  String _generateFileName() {
    DateTime dateTime = DateTime.now();
    String fileName = 'Temp_' +
        dateTime.year.toString() +
        dateTime.month.toString() +
        dateTime.day.toString() +
        dateTime.hour.toString() +
        dateTime.minute.toString() +
        dateTime.second.toString() +
        dateTime.millisecond.toString() +
        dateTime.microsecond.toString();
    return fileName;
  }

  Future<String> processCanvasPoints(List<Offset> points) async {
    final canvasSizeWithPadding = kCanvasSize + (2 * kCanvasInnerOffset);
    final canvasOffset = Offset(kCanvasInnerOffset, kCanvasInnerOffset);
    final recorder = PictureRecorder();
    final canvas = Canvas(
      recorder,
      Rect.fromPoints(
        Offset(0.0, 0.0),
        Offset(canvasSizeWithPadding, canvasSizeWithPadding),
      ),
    );

    canvas.drawRect(
        Rect.fromLTWH(0, 0, canvasSizeWithPadding, canvasSizeWithPadding),
        kBackgroundPaint);

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(
            points[i] + canvasOffset, points[i + 1] + canvasOffset, kPaint);
      }
    }

    final picture = recorder.endRecording();
    final img = await picture.toImage(800, 800);
    final imgBytes = await img.toByteData(format: ImageByteFormat.png);
    Uint8List pngUint8List = imgBytes.buffer.asUint8List();

    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    await Directory('$tempPath/$kCacheDirectoryName').create(recursive: true);
    String imageFilePath =
        '$tempPath/$kCacheDirectoryName/${_generateFileName()}.png';
    File('$imageFilePath').writeAsBytesSync(pngUint8List);

    return imageFilePath;
  }

  //for debug only
  // String formatBytes(int bytes, int decimals) {
  //   if (bytes <= 0) return "0 B";
  //   const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
  //   var i = (log(bytes) / log(1024)).floor();
  //   return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
  //       ' ' +
  //       suffixes[i];
  // }

  Future<String> getOCRResult(List<Offset> points) async {
    String imageFilePath = await processCanvasPoints(points);
    //print(formatBytes(File(imageFilePath).lengthSync(), 2));
    //print(imageFilePath);
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFilePath(imageFilePath);
    final TextRecognizer textRecognizer =
        FirebaseVision.instance.textRecognizer();
    final VisionText visionText =
        await textRecognizer.processImage(visionImage);

    // final TextRecognizer cloudTextRecognizer =
    //     FirebaseVision.instance.cloudTextRecognizer();
    // final VisionText visionText =
    //     await cloudTextRecognizer.processImage(visionImage);

    String result = '';

    for (TextBlock block in visionText.blocks)
      for (TextLine line in block.lines)
        for (TextElement element in line.elements) result += element.text;
    //print(result);
    return result;
  }
}
