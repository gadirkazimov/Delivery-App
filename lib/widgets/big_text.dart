
import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

class BigText extends StatelessWidget {

  final String text;
  Color color;
  double size;
  TextOverflow overflow;


  BigText({super.key,
    required this.text,
    this.color = const Color(0xFF89dad0),
    this.size = 0,
    this.overflow = TextOverflow.ellipsis });

  @override
  Widget build(BuildContext context) {
    return Text(text, maxLines: 1, overflow: overflow, style: TextStyle(fontSize: size==0 ? Dimensions.font20 : size, color: color),);
  }
}
