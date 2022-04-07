import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/constants/app_constants.dart';
import 'package:food_ordering_app/constants/colors.dart';
import 'package:food_ordering_app/constants/dimensions.dart';
import 'package:food_ordering_app/controllers/popular_product_controller.dart';
import 'package:food_ordering_app/controllers/recommended_product_controller.dart';
import 'package:food_ordering_app/models/product.dart';
import 'package:food_ordering_app/pages/food/popular_food_detail.dart';
import 'package:food_ordering_app/route/app_routes.dart';
import 'package:food_ordering_app/widgets/food_info_column.dart';
import 'package:food_ordering_app/widgets/icon_and_text_widget.dart';
import 'package:food_ordering_app/widgets/sized_text.dart';
import 'package:food_ordering_app/widgets/small_text.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('======================='+ MediaQuery.of(context).size.width.toString());
    return Column(
      children: [
        //slider
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return popularProducts.isLoaded?Container(
              // color: Colors.red,
              height: Dimensions.pageView,
             
               
                child: PageView.builder(
                    controller: pageController,
                    itemCount: popularProducts.popularProductList.length,
                    itemBuilder: (context, pos) {
                      return _buildPageItem(pos, popularProducts.popularProductList[pos]);
                    }),
              
            ): CircularProgressIndicator(color: AppColors.mainColor,);
          }
        ),
        //dots
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return DotsIndicator(
              dotsCount: popularProducts.popularProductList.length<=0?1:popularProducts.popularProductList.length,
              position: _currPageValue,
              decorator: DotsDecorator(
                activeColor: AppColors.mainColor,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            );
          }
        ),
        //popular text
        SizedBox(height: Dimensions.height25,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedText(text: "Recommended"),
              SizedBox(width: Dimensions.width8,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: SizedText(text: ".",color: Colors.black26,),
              ),
              SizedBox(width: Dimensions.width8,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: 'Food pairing',),)
            ],
          ),
        ),
        //list of food and images
        GetBuilder<RecommendedProductController>(
          builder: (recommendedProduct) {
            return recommendedProduct.isLoaded? Container(
              height: Dimensions.listViewContainer,
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: recommendedProduct.recommendedProductList.length,
                itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.getRecommendedFood(index));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: Dimensions.width16, right: Dimensions.width16),
                    child: Row(children: [
                      //image section
                      Container(
                        width: Dimensions.listViewImgSize,
                        height: Dimensions.listViewImgSize ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius16),
                          color: Colors.white38,
                          image: DecorationImage(image: NetworkImage(AppConstants.BASE_URL + AppConstants.UPLOAD_URL + recommendedProduct.recommendedProductList[index].img!)),
                        ),
                      ),
                      //text container
                      Expanded(
                        child: Container(
                          // width: 200,
                          height: Dimensions.listViewTextContainer,
                          decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radius16), bottomRight: Radius.circular(Dimensions.radius16)),color: Colors.white),
                          child: Padding(padding: EdgeInsets.only(left: Dimensions.width8 ,right: Dimensions.width8)
                          ,child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            SizedText(text: recommendedProduct.recommendedProductList[index].name!),
                            SizedBox(height: Dimensions.height8,),
                            SmallText(text: recommendedProduct.recommendedProductList[index].description!),
                            SizedBox(height: Dimensions.height8,),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndTextWidget(
                                    icon: Icons.circle_sharp,
                                    text: 'Normal',
                                    iconColor: AppColors.iconColor1),
                                IconAndTextWidget(
                                    icon: Icons.location_on,
                                    text: '1.7km',
                                    iconColor: AppColors.mainColor),
                                IconAndTextWidget(
                                    icon: Icons.access_time_rounded,
                                    text: '32min',
                                    iconColor: AppColors.iconColor2),
                              ],
                            ),
                          ],),),
                
                        
                        ),
                      ),
                    ],),
                  ),
                );
              }),
            ): CircularProgressIndicator(color: AppColors.mainColor,);
          }
        ),
      ],
    );
  }

  Widget _buildPageItem(int position, ProductModel popularProduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (position == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - position) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (position == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - position + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (position == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - position) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Container(
        // color: Colors.red,
        child: Stack(
          children: [
              GestureDetector(
                 onTap: (){
                  Get.toNamed(AppRoutes.getPopularFood(position));
                },
                child: Container(
                height: Dimensions.pageViewContainer,
                margin: EdgeInsets.only(left: Dimensions.width8, right: Dimensions.width8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius25),
                    color: position.isEven ? Color(0xff69c5df) : Color(0xff9294cc),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppConstants.BASE_URL + AppConstants.UPLOAD_URL + popularProduct.img!),
                    )),
                          ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(left: Dimensions.width25, right: Dimensions.width25, bottom: Dimensions.height25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0XFFE8E8E8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.only(top: Dimensions.height12, left: Dimensions.width12, right: Dimensions.width12),
                  child:FoodInfoColumn(text: popularProduct.name!,)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
