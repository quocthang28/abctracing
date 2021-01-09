import 'package:flutter/material.dart';

class VideoWidget extends StatefulWidget {
  VideoWidget({@required this.fileName, this.type});

  final String fileName;
  final int type; //1 number 2 upper 3 lower
  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      child: widget.type == 1 ? Text('test') : Image.asset(
        widget.type == 2
            ? 'assets/alphabet_gifs/uppercase/${widget.fileName}.gif'
            : 'assets/alphabet_gifs/lowercase/${widget.fileName}.gif',
        width: 270.0,
        height: 270.0,
      ),
    );
  }
}
