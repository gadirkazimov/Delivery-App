


import 'package:food_delivery/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class PopularProductRepo extends GetxService {

  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductlist() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}