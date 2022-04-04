import 'package:flutter/material.dart';
import 'package:food_ordering_app/constants/colors.dart';
import 'package:food_ordering_app/constants/dimensions.dart';
import 'package:food_ordering_app/route/app_routes.dart';
import 'package:food_ordering_app/widgets/expandable_text_widget.dart';
import 'package:food_ordering_app/widgets/icon.dart';
import 'package:food_ordering_app/widgets/sized_text.dart';
import 'package:get/get.dart';

class RecomendedFoodDetail extends StatelessWidget {
  const RecomendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                AppIcon(icon: Icons.shopping_cart),
              ],
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: Container(
                  child: Center(
                      child: SizedText(
                    text: 'Ethiopian side',
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
              background: Image.asset(
                "assets/image/food0.png",
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
                    child: ExpandableTextWidget(
                        text:
                            "chicken marinated chicken marinated in a spicy sauce ethiopian style chicken marinated in a spicy sauce ethiopian style chicken marinated in a spicy sauce ethiopian style chicken marinated in a spicy sauce ethiopian style chicken marinated in a spicy sauce ethiopian style chicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian style chicken marinated chicken marinated in a spicy sauce ethiopian style chicken marinated chicken marinated in a spicy sauce ethiopian style chicken marinated chicken marinated in a spicy sauce ethiopian style chicken marinated chicken marinated in a spicy sauce ethiopian style chicken marinated in a spicy sauce ethiopian style chicken marinated chicken marinated in a spicy sauce ethiopian style chicken marinated chicken marinated in a spicy sauce ethiopian style chicken marinated chicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylevchicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian style chicken marinated in a spicy sauce ethiopian style chicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian style chicken marinated in a spicy sauce ethiopian style chicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian style chicken marinated in a spicy sauce ethiopian style chicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian style chicken marinated in a spicy sauce ethiopian style chicken marinated in a spicy sauce ethiopian style chicken marinated in a spicy sauce ethiopian style chicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian stylechicken marinated in a spicy sauce ethiopian style chicken marinated in a spicy sauce ethiopian style")),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
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
                AppIcon(
                    iconSize: Dimensions.iconSize20,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.remove),
                SizedText(
                  text: '\$12.88 ' + 'X ' + '0',
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font21,
                ),
                AppIcon(
                    iconSize: Dimensions.iconSize20,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.add)
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
                      borderRadius: BorderRadius.circular(Dimensions.radius16),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    )),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height16,
                      bottom: Dimensions.height16,
                      left: Dimensions.width16,
                      right: Dimensions.width16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius16),
                    color: AppColors.mainColor,
                  ),
                  child: SizedText(
                    text: '10ETB | Add to cart',
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
