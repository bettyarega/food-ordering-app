import 'package:flutter/material.dart';
import 'package:food_ordering_app/constants/dimensions.dart';

class SizedText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow textOverflow;
  SizedText({
    Key? key,
    this.color = const Color(0xFF332D2B),
    required this.text,
    this.size = 0,
    this.textOverflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        fontSize: size== 0?Dimensions.font16: size,
      ),
    );
  }
}
