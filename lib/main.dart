import 'package:flutter/material.dart';
import 'package:food_ordering_app/controllers/popular_product_controller.dart';
import 'package:food_ordering_app/controllers/recommended_product_controller.dart';
import 'package:food_ordering_app/pages/food/popular_food_detail.dart';
import 'package:food_ordering_app/pages/food/recomended_food_detail.dart';
import 'package:food_ordering_app/pages/home/food_page_body.dart';
import 'package:food_ordering_app/pages/home/food_page_main.dart';
import 'package:food_ordering_app/route/app_routes.dart';
import 'package:get/get.dart';
import 'utility/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      home: FoodPageMain(),
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.routes,
    );
  }
}
