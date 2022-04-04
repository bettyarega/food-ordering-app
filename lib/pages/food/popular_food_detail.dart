import 'package:flutter/material.dart';
import 'package:food_ordering_app/constants/app_constants.dart';
import 'package:food_ordering_app/constants/colors.dart';
import 'package:food_ordering_app/constants/dimensions.dart';
import 'package:food_ordering_app/controllers/popular_product_controller.dart';
import 'package:food_ordering_app/widgets/expandable_text_widget.dart';
import 'package:food_ordering_app/widgets/food_info_column.dart';
import 'package:food_ordering_app/widgets/icon.dart';
import 'package:food_ordering_app/widgets/icon_and_text_widget.dart';
import 'package:food_ordering_app/widgets/sized_text.dart';
import 'package:food_ordering_app/widgets/small_text.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({ Key? key, required this.pageId }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
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
                image: NetworkImage(AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!),),
            ),
          ),),
        //icon widget
        Positioned(
          top: Dimensions.height36,
          left: Dimensions.width16,
          right: Dimensions.width16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(icon: Icons.arrow_back_ios),
              AppIcon(icon: Icons.shopping_cart_outlined),
            ],
          )),
        //introduction
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: Dimensions.popularFoodImgSize -16,

          child: Container(
            padding: EdgeInsets.only(left: Dimensions.width16, right: Dimensions.width16, top: Dimensions.height16 ),
            decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radius16), topLeft: Radius.circular(Dimensions.radius16),),color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FoodInfoColumn(text: product.name!,),
                SizedBox(height: Dimensions.height16,),
                SizedText(text: 'Introduce'),
                //expandable text
                Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: product.description!))

                )],
            ),
                
        ))
    

      ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.pageViewTextContainer,
        padding: EdgeInsets.only(top: Dimensions.height25, bottom: Dimensions.height25, left: Dimensions.height16, right: Dimensions.height16,),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius16*2),
            topRight: Radius.circular(Dimensions.radius16*2),

          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height16, bottom: Dimensions.height16, left: Dimensions.width16, right: Dimensions.width16),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius16),
              color: Colors.white,),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor,),
                  SizedBox(width: Dimensions.width8/2,),
                  SizedText(text: '0'),
                  SizedBox(width: Dimensions.width8/2,),
                  Icon(Icons.add, color: AppColors.signColor,)
                ],
              ),),
            Container(
                padding: EdgeInsets.only(top: Dimensions.height16, bottom: Dimensions.height16, left: Dimensions.width16, right: Dimensions.width16),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius16),
                color: AppColors.mainColor,
                ),
                child: SizedText(text: '${product.price!}\$ | Add to cart',color: Colors.white,),
              )

          ],
        ),
          
      ),
    );
  }
}