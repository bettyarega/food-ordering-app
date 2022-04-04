import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
   TextOverflow textOverflow;

  SmallText(
      {Key? key,
      this.color = const Color(0xFFCCC7c5),
      required this.text,
      this.size = 12,
      this.height = 1.2,
      this.textOverflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // maxLines: 1,
      style: TextStyle(
        color: color,
        height: height,
        fontFamily: 'Roboto',
        fontSize: size,
      ),
    );
  }
}
