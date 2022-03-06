import 'package:flutter/material.dart';
import 'package:food_ordering_app/constants/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  const AppIcon({ Key? key,
  required this.icon, 
  this.backgroundColor = const Color(0xFFFCF4E4),
  this.iconColor = const Color(0xFF756D54),
  this.size = 0 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size==0?Dimensions.iconContainer: size,
      height: size==0?Dimensions.iconContainer: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size==0?Dimensions.iconContainer/2: size/2),
        color: backgroundColor
      ),
      child: Icon(icon, color: iconColor, size: Dimensions.iconSize13,),
      
    );
  }
}