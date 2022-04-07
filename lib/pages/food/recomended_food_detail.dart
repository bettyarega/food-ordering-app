import 'package:flutter/material.dart';
import 'package:food_ordering_app/constants/app_constants.dart';
import 'package:food_ordering_app/constants/colors.dart';
import 'package:food_ordering_app/constants/dimensions.dart';
import 'package:food_ordering_app/controllers/cart_controller.dart';
import 'package:food_ordering_app/controllers/popular_product_controller.dart';
import 'package:food_ordering_app/controllers/recommended_product_controller.dart';
import 'package:food_ordering_app/pages/cart/cart_page.dart';
import 'package:food_ordering_app/route/app_routes.dart';
import 'package:food_ordering_app/widgets/expandable_text_widget.dart';
import 'package:food_ordering_app/widgets/icon.dart';
import 'package:food_ordering_app/widgets/sized_text.dart';
import 'package:get/get.dart';

class RecomendedFoodDetail extends StatelessWidget {
  final int pageId;
  RecomendedFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.getHome()),
                    child: AppIcon(icon: Icons.clear)),
                //AppIcon(icon: Icons.shopping_cart),
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
                                      Get.to(()=> CartPage());
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
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: Container(
                  child: Center(
                      child: SizedText(
                    text: product.name!,
                    size: Dimensions.font21,
                  )),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5, bottom: Dimensions.height8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            Dimensions.radius16,
                          ),
                          topRight: Radius.circular(Dimensions.radius16))),
                )),
            backgroundColor: AppColors.yellowColor,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width16, right: Dimensions.width16),
                    child: ExpandableTextWidget(text: product.description!)),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width25 * 2,
                  right: Dimensions.width25 * 2,
                  top: Dimensions.height8,
                  bottom: Dimensions.height8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(false);
                    },
                    child: AppIcon(
                        iconSize: Dimensions.iconSize20,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        icon: Icons.remove),
                  ),
                  SizedText(
                    text: '\$ ${product.price!} X  ${controller.inCartItems}',
                    color: AppColors.mainBlackColor,
                    size: Dimensions.font21,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(true);
                    },
                    child: AppIcon(
                        iconSize: Dimensions.iconSize20,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        icon: Icons.add),
                  )
                ],
              ),
            ),
            Container(
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
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius16),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      )),
                  GestureDetector(
                    onTap: () {
                      controller.addItem(product);
                    },
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
                        text: '${product.price}ETB | Add to cart',
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
