

import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/products_model.dart';
import '../utils/colors.dart';

class PopularProductController extends GetxController {

  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List <dynamic> _popularProductList=[];
  List <dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  get quantity => _quantity;


  Future<void> getPopularProductList() async {
      Response response = await popularProductRepo.getPopularProductlist();
      if(response.statusCode == 200) {
        _popularProductList = [];
        _popularProductList.addAll(Products.fromJson(response.body).products);
        _isLoaded = true;
        update();
      }
  }

  void setQuantity (bool isIncreament) {
    if(isIncreament) {
      _quantity = checkQuantity(_quantity + 1);
      ;

    } else {
      _quantity = checkQuantity(_quantity - 1);

    }
    update();
  }
  
  int checkQuantity (int abc) {
    if(abc < 0) {
      Get.snackbar('Item count', 'You cant decrease anymore',
          backgroundColor: AppColors.mainColor, colorText: Colors.white
      );
      return 0;
    } else if (abc > 20) {
      Get.snackbar('Item Count', 'You cant add anymore',
          backgroundColor: AppColors.mainColor, colorText: Colors.white
      );
      return 20;
    } else {
      return abc;
    }
  }

}