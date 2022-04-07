import 'package:food_ordering_app/constants/app_constants.dart';
import 'package:food_ordering_app/controllers/cart_controller.dart';
import 'package:food_ordering_app/controllers/popular_product_controller.dart';
import 'package:food_ordering_app/controllers/recommended_product_controller.dart';
import 'package:food_ordering_app/data/api/api_client.dart';
import 'package:food_ordering_app/data/repository/cart_repo.dart';
import 'package:food_ordering_app/data/repository/popular_product_repo.dart';
import 'package:food_ordering_app/data/repository/recommended_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async{
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());
  
  //controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}