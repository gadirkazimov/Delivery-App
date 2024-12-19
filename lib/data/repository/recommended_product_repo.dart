


import 'package:food_delivery/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class RecommendedProductRepo extends GetxService {

  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductlist() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}