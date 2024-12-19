import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../routes/routes_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/dimensions.dart';


class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {

    var product = Get.find<PopularProductController>().popularProductList[pageId];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //Background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppConstants.APP_BASE_URL + AppConstants.UPLOADS + product.img)
                  )
                ),
              )
          ),
          //Icon Widgets
          Positioned(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.height45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        Get.toNamed(RoutesHelper.getInitial());
                      },
                      child: const AppIcon(icon: Icons.arrow_back_ios)
                  ),
                  const AppIcon(icon: Icons.add_shopping_cart)
                ],
              )
          ),
          // Food introduction
          Positioned(
              top: Dimensions.popularFoodHeight-20,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: product.name, ),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: 'Introduce', color: AppColors.mainBlackColor),
                    SizedBox(height: Dimensions.height10,),
                    Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: product.description),))
                  ],
                ),
              )
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct) {
        return Container(
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
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(false);
                        },
                        child: const Icon(Icons.remove)
                    ),
                    SizedBox(width: Dimensions.width5,),
                    BigText(text: popularProduct.quantity.toString(), color: AppColors.mainBlackColor,),
                    SizedBox(width: Dimensions.width5,),
                    GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(true);
                        },
                        child: const Icon(Icons.add)
                    ),
                  ],
                ),
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
        );
      },),
    );
  }
}
