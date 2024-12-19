import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/routes/routes_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';


class RecommendedFoodDetail extends StatelessWidget {
  int pageId;
  RecommendedFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {

    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.yellowColor,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  AppConstants.APP_BASE_URL + AppConstants.UPLOADS + product.img,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RoutesHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.close)
                ),
                AppIcon(icon: Icons.add_shopping_cart,)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)
                  ),
                  color: Colors.white
                ),
                child: Center(child: BigText(text: product.name, size: Dimensions.font24, color: AppColors.mainBlackColor,)),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:  Container(
              margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
              child: ExpandableTextWidget(text: product.description),
            )
          )

        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(
                left: Dimensions.width20*2.5,
                right: Dimensions.width20*2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.remove, backgroundColor: AppColors.mainColor, iconColor: Colors.white,),
                BigText(text: '\$ ${product.price} X  0', color: AppColors.mainBlackColor,),
                AppIcon(icon: Icons.add, backgroundColor: AppColors.mainColor, iconColor: Colors.white,)
              ],
            ),
          ),
          Container(
            height: Dimensions.height140,
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height30),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20*2),
                  topRight: Radius.circular(Dimensions.radius20*2),
                )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white
                  ),
                  child: Icon(Icons.favorite, color: AppColors.mainColor,)
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor
                  ),
                  child: Row(

                    children: [
                      BigText(text: '\$ ${product.price}', color: Colors.white,),
                      SizedBox(width: Dimensions.width5,),
                      BigText(text: '|', color: Colors.white,),
                      SizedBox(width: Dimensions.width5,),
                      BigText(text: 'Add to cart', color: Colors.white,)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
