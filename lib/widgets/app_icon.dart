import 'package:flutter/material.dart';

import '../utils/dimensions.dart';


class AppIcon extends StatelessWidget {

  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;


  const AppIcon({super.key,
  required this.icon,
    this.backgroundColor = const Color(0xFFfcf4e4),
    this.iconColor = const Color(0xFF756d54),
    this.size = 40.0

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(size/2),color: backgroundColor ),
      child: Icon(icon, color: iconColor, size: Dimensions.iconSize20,),
    );
  }
}
