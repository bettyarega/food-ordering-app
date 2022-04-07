import 'package:flutter/material.dart';
import 'package:food_ordering_app/constants/app_constants.dart';
import 'package:food_ordering_app/constants/colors.dart';
import 'package:food_ordering_app/constants/dimensions.dart';
import 'package:food_ordering_app/controllers/cart_controller.dart';
import 'package:food_ordering_app/controllers/popular_product_controller.dart';
import 'package:food_ordering_app/pages/cart/cart_page.dart';
import 'package:food_ordering_app/route/app_routes.dart';
import 'package:food_ordering_app/widgets/expandable_text_widget.dart';
import 'package:food_ordering_app/widgets/food_info_column.dart';
import 'package:food_ordering_app/widgets/icon.dart';
import 'package:food_ordering_app/widgets/icon_and_text_widget.dart';
import 'package:food_ordering_app/widgets/sized_text.dart';
import 'package:food_ordering_app/widgets/small_text.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            //background image
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        product.img!),
                  ),
                ),
              ),
            ),
            //icon widget
            Positioned(
                top: Dimensions.height36,
                left: Dimensions.width16,
                right: Dimensions.width16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.getHome()),
                        child: AppIcon(icon: Icons.arrow_back_ios)),
                    GetBuilder<PopularProductController>(builder: (controller) {
                      return Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_outlined),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? Positioned(
                                  right: 0,
                                  top: 0,
                                  child: GestureDetector(
                                    onTap: (){
                                      Get.to(() => CartPage());
                                    },
                                    child: AppIcon(
                                      icon: Icons.circle,
                                      size: 20,
                                      iconColor: Colors.transparent,
                                      backgroundColor: AppColors.mainColor,
                                    ),
                                  ))
                              : Container(),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? Positioned(
                                  right: 5,
                                  top: 3,
                                  child: SizedText(
                                    text: Get.find<PopularProductController>()
                                        .totalItems
                                        .toString(),
                                    size: 12,
                                    color: Colors.white,
                                  ))
                              : Container()
                        ],
                      );
                    }),
                  ],
                )),
            //introduction
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: Dimensions.popularFoodImgSize - 16,
                child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width16,
                      right: Dimensions.width16,
                      top: Dimensions.height16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius16),
                        topLeft: Radius.circular(Dimensions.radius16),
                      ),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FoodInfoColumn(
                        text: product.name!,
                      ),
                      SizedBox(
                        height: Dimensions.height16,
                      ),
                      SizedText(text: 'Introduce'),
                      //expandable text
                      Expanded(
                          child: SingleChildScrollView(
                              child: ExpandableTextWidget(
                                  text: product.description!)))
                    ],
                  ),
                ))
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (popularProduct) {
            return Container(
              height: Dimensions.pageViewTextContainer,
              padding: EdgeInsets.only(
                top: Dimensions.height25,
                bottom: Dimensions.height25,
                left: Dimensions.height16,
                right: Dimensions.height16,
              ),
              decoration: BoxDecoration(
                  color: AppColors.buttonBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius16 * 2),
                    topRight: Radius.circular(Dimensions.radius16 * 2),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height16,
                        bottom: Dimensions.height16,
                        left: Dimensions.width16,
                        right: Dimensions.width16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius16),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () => popularProduct.setQuantity(false),
                            child: Icon(
                              Icons.remove,
                              color: AppColors.signColor,
                            )),
                        SizedBox(
                          width: Dimensions.width8 / 2,
                        ),
                        SizedText(text: popularProduct.inCartItems.toString()),
                        SizedBox(
                          width: Dimensions.width8 / 2,
                        ),
                        GestureDetector(
                            onTap: () => popularProduct.setQuantity(true),
                            child: Icon(
                              Icons.add,
                              color: AppColors.signColor,
                            ))
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => popularProduct.addItem(product),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height16,
                          bottom: Dimensions.height16,
                          left: Dimensions.width16,
                          right: Dimensions.width16),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius16),
                        color: AppColors.mainColor,
                      ),
                      child: SizedText(
                        text: '${product.price!}\$ | Add to cart',
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
