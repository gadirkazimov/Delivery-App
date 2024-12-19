
import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

class SmallText extends StatelessWidget {

  final String text;
  Color color;
  double size;
  double height;

  SmallText({
    super.key,
    required this.text,
    this.color = const Color(0xFFccc7c5),
    this.size = 0,
    this.height = 1.2
     });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: size==0 ? Dimensions.font14 : size, height: height, color: color),);
  }
}
