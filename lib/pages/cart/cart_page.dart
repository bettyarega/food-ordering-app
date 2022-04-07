import 'package:flutter/material.dart';
import 'package:food_ordering_app/constants/app_constants.dart';
import 'package:food_ordering_app/constants/colors.dart';
import 'package:food_ordering_app/constants/dimensions.dart';
import 'package:food_ordering_app/controllers/cart_controller.dart';
import 'package:food_ordering_app/controllers/popular_product_controller.dart';
import 'package:food_ordering_app/pages/home/food_page_main.dart';
import 'package:food_ordering_app/widgets/icon.dart';
import 'package:food_ordering_app/widgets/sized_text.dart';
import 'package:food_ordering_app/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height16 * 3,
              left: Dimensions.width16,
              right: Dimensions.width16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      size: Dimensions.iconSize20,
                      backgroundColor: AppColors.mainColor),
                  SizedBox(
                    width: Dimensions.width16 * 5,
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(() => FoodPageMain());
                    },
                    child: AppIcon(
                        icon: Icons.home_outlined,
                        iconColor: Colors.white,
                        size: Dimensions.iconSize20,
                        backgroundColor: AppColors.mainColor),
                  ),
                  AppIcon(
                      icon: Icons.shopping_cart,
                      iconColor: Colors.white,
                      size: Dimensions.iconSize20,
                      backgroundColor: AppColors.mainColor),
                ],
              )),
          Positioned(
              top: Dimensions.height16 * 5,
              left: Dimensions.width16,
              right: Dimensions.width16,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height12),
                //color: Colors.red,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(
                    builder: (cartController) {
                      return ListView.builder(
                          itemCount: cartController.getItems.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 100,
                              width: double.maxFinite,
                              child: Row(children: [
                                Container(
                                  width: Dimensions.height25 * 4,
                                  height: Dimensions.height25 * 4,
                                  margin:
                                      EdgeInsets.only(bottom: Dimensions.height8),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              NetworkImage(AppConstants.BASE_URL +AppConstants.UPLOAD_URL + cartController.getItems[index].img!)),
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius16),
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: Dimensions.width8,
                                ),
                                Expanded(
                                    child: Container(
                                  height: Dimensions.height25 * 4,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedText(
                                        text: cartController.getItems[index].name!,
                                        color: Colors.black54,
                                      ),
                                      SmallText(text: 'spicy'),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedText(
                                            text: '\$${cartController.getItems[index].price}',
                                            color: Colors.redAccent,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: Dimensions.height8,
                                                bottom: Dimensions.height8,
                                                left: Dimensions.width8,
                                                right: Dimensions.width8),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  Dimensions.radius16),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                    //onTap: () => popularProduct.setQuantity(false),
                                                    child: Icon(
                                                  Icons.remove,
                                                  color: AppColors.signColor,
                                                )),
                                                SizedBox(
                                                  width: Dimensions.width8 / 2,
                                                ),
                                                SizedText(
                                                    text:
                                                        '0'),
                                                SizedBox(
                                                  width: Dimensions.width8 / 2,
                                                ),
                                                GestureDetector(
                                                    // onTap: () => popularProduct.setQuantity(true),
                                                    child: Icon(
                                                  Icons.add,
                                                  color: AppColors.signColor,
                                                ))
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                              ]),
                            );
                          });
                    }
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
