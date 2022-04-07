import 'package:food_ordering_app/pages/food/popular_food_detail.dart';
import 'package:food_ordering_app/pages/food/recomended_food_detail.dart';
import 'package:food_ordering_app/pages/home/food_page_main.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String home = '/';
  static const String popularFood = '/popularFood';
  static const String recommendedFood = '/recommendedFood';

  static String getHome() => '$home';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) => '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: home, page: () => FoodPageMain()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecomendedFoodDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
  ];
}
