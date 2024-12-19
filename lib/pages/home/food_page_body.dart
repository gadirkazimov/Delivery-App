import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/models/products_model.dart';

import 'package:food_delivery/utils/app_constants.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../routes/routes_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';



class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}


class _FoodPageBodyState extends State<FoodPageBody> {

  PageController pageController = PageController(viewportFraction: 0.85);

  var _currentPageValue = 0.0;

  @override
   void initState () {
    super.initState();
    pageController.addListener( (){
      setState(() {
        _currentPageValue = pageController.page!;
      });
    }
    );
  }

  @override
  void dispose () {
    super.dispose();
    super.initState();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Page-view Container
        GetBuilder<PopularProductController>(
            builder: (popularProduct) {
            return popularProduct.isLoaded ?
            Container(
              height: Dimensions.pageView,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: popularProduct.popularProductList.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesHelper.getPopularFood(index));
                          },
                          child: Container(
                            height: Dimensions.imageContainer,
                            margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.radius30),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(AppConstants.APP_BASE_URL + AppConstants.UPLOADS + popularProduct.popularProductList[index].img))
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: Dimensions.textContainer,
                            margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height10),
                            padding: EdgeInsets.symmetric(horizontal: Dimensions.width15, vertical: Dimensions.height15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white
                            ),
                            child: AppColumn(text: popularProduct.popularProductList[index].name),
                          ),
                        )
                      ],
                    );;
                  }
              )
          ) :
            CircularProgressIndicator(color: AppColors.mainColor,);
        }),
        // Dots
        GetBuilder<PopularProductController>(builder: (popularProduct) {
          return DotsIndicator(
            dotsCount: popularProduct.popularProductList.isEmpty? 1 : popularProduct.popularProductList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        //Recommended text
        Container(
          margin: EdgeInsets.only(left: Dimensions.width20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [BigText(text: 'Recommended', color: AppColors.mainBlackColor, size: Dimensions.font24,)]),
        ),
        //Recommended list.view builder
        GetBuilder<RecommendedProductController>(
            builder: (recommendedProduct) {
              return recommendedProduct.isLoaded ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesHelper.getRecommendedFood(index));
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10, bottom: Dimensions.height10),
                        child: Row(
                          children: [
                            Container(
                              height: Dimensions.height140,
                              width: Dimensions.height140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                                  color: Colors.white38,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(AppConstants.APP_BASE_URL + AppConstants.UPLOADS + recommendedProduct.recommendedProductList[index].img)
                                  )
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: Dimensions.height120,
                                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radius20), bottomRight: Radius.circular(Dimensions.radius20)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigText(text: recommendedProduct.recommendedProductList[index].name, color: Colors.black54,),
                                    SmallText(text: 'With chease', size: Dimensions.font20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndText(text: 'Normal', icon: Icons.circle, iconColor: AppColors.iconColor1),
                                        IconAndText(text: '1.7 km', icon: Icons.location_on_sharp, iconColor: AppColors.mainColor),
                                        IconAndText(text: '32 min', icon: Icons.timer, iconColor: AppColors.iconColor2)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }) : CircularProgressIndicator(color: AppColors.mainColor,);
            }
        )
      ],
    );
  }


}
