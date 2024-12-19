import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text.dart';


class AppColumn extends StatelessWidget {

  final String text;

  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font24, color: AppColors.mainBlackColor,),
        SizedBox(height: Dimensions.height10,),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) => Icon(Icons.star, size: 15, color: AppColors.mainColor,)),
            ),
            const SizedBox(width: 10.0,),
            SmallText(text: '4,5', size: 14,),
            const SizedBox(width: 10.0,),
            SmallText(text: '1287'),
            const SizedBox(width: 5.0,),
            SmallText(text: 'coments')
          ],
        ),
        SizedBox(height: Dimensions.height10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndText(text: 'Normal', icon: Icons.circle, iconColor: AppColors.iconColor1),
            IconAndText(text: '1.7 km', icon: Icons.location_on_sharp, iconColor: AppColors.mainColor),
            IconAndText(text: '32 min', icon: Icons.timer, iconColor: AppColors.iconColor2)
          ],
        )
      ],
    );
  }
}
