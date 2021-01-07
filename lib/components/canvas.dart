import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:text_reg/utils/constants.dart';
import 'package:text_reg/components/drawing_painter.dart';
import 'package:text_reg/services/process_canvas.dart';

class Canvas extends StatefulWidget {
  Canvas({@required this.checkAnswer});

  //final Function(String) checkAnswer; // callback
  final ValueChanged<String> checkAnswer;

  @override
  _CanvasState createState() => _CanvasState();
}

class _CanvasState extends State<Canvas> {
  ProcessCanvasService get pcs => GetIt.I<ProcessCanvasService>();
  List<Offset> _points = [];
  String _answer;
  bool hint = false;

  void _deleteCacheDir() async {
    var cacheDir = await getTemporaryDirectory();
    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }
  }

  void _clearCanvas() {
    _deleteCacheDir();
    setState(() {
      _points.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //canvas
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 3.0,
              color: Colors.black,
            ),
          ),
          child: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    RenderBox renderBox = context.findRenderObject();
                    _points
                        .add(renderBox.globalToLocal(details.globalPosition));
                  });
                },
                onPanStart: (details) {
                  setState(() {
                    RenderBox renderBox = context.findRenderObject();
                    _points
                        .add(renderBox.globalToLocal(details.globalPosition));
                  });
                },
                onPanEnd: (details) {
                  _points.add(null);
                },
                child: ClipRect(
                  child: Stack(
                    children: [
                      Container(
                        width: kCanvasSize,
                        height: kCanvasSize,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 10.0,
                              color: Color.fromRGBO(186, 121, 52, 1.0)),
                          color: Color.fromRGBO(30, 61, 29, 1.0),
                        ),
                      ),
                      CustomPaint(
                        size: Size(kCanvasSize, kCanvasSize),
                        painter: DrawingPainter(
                          offsetPoints: _points,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.red,
              onPressed: _clearCanvas,
              child: Icon(Icons.cleaning_services_rounded),
            ),
            FlatButton(
              color: Colors.blue,
              onPressed: () async {
                _answer = await pcs.getOCRResult(_points);
                widget.checkAnswer(_answer);
                print(_answer);
                _clearCanvas();
              },
              child: Icon(Icons.check),
            ),
          ],
        ),
      ],
    );
  }
}
