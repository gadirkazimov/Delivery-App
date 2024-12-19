import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatelessWidget {
  const MainFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: 'Bangladesh'),
                    Row(
                      children: [
                        SmallText(text: 'Narshingdi', color: AppColors.mainBlackColor, ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    )

                  ],
                ),
                Container(
                  height: Dimensions.height30,
                  width: Dimensions.width30,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius10), color: AppColors.mainColor),
                  child: Icon(Icons.search, size: Dimensions.iconSize24, color: Colors.white,),
                )
              ],
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
             child: FoodPageBody(),),)
        ],
      )
    );
  }
}
