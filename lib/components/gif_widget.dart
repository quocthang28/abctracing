import 'package:flutter/material.dart';

class GIFWidget extends StatefulWidget {
  GIFWidget({@required this.fileName, this.type});

  final String fileName;
  final int type; //1 number 2 upper 3 lower
  @override
  _GIFWidgetState createState() => _GIFWidgetState();
}

class _GIFWidgetState extends State<GIFWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black.withOpacity(0)),
      child: Image.asset(
        widget.type == 1 ? 'assets/number_gifs/${widget.fileName}.gif'
        : widget.type == 2
            ? 'assets/alphabet_gifs/uppercase/${widget.fileName}.gif'
            : 'assets/alphabet_gifs/lowercase/${widget.fileName}.gif',
        width: widget.type == 1 ? 270 : 270.0,
        height: 270.0,
      ),
    );
  }
}
