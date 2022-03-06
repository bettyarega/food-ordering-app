import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/constants/colors.dart';
import 'package:food_ordering_app/constants/dimensions.dart';
import 'package:food_ordering_app/widgets/food_info_column.dart';
import 'package:food_ordering_app/widgets/icon_and_text_widget.dart';
import 'package:food_ordering_app/widgets/sized_text.dart';
import 'package:food_ordering_app/widgets/small_text.dart';

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
        Container(
          // color: Colors.red,
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, pos) {
                return _buildPageItem(pos);
              }),
        ),
        //dots
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        //popular text
        SizedBox(height: Dimensions.height25,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedText(text: "Popular"),
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
        Container(
          height: Dimensions.listViewContainer,
          child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index){
            return Container(
              margin: EdgeInsets.only(left: Dimensions.width16, right: Dimensions.width16),
              child: Row(children: [
                //image section
                Container(
                  width: Dimensions.pageViewTextContainer,
                  height: Dimensions.pageViewTextContainer ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius16),
                    color: Colors.white38,
                    image: DecorationImage(image: AssetImage('assets/image/food0.png')),
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
                      SizedText(text: "Nutritious fruit in Ethiopia"),
                      SizedBox(height: Dimensions.height8,),
                      SmallText(text: "with Ethiopian characteristics"),
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
            );
          }),
        ),
      ],
    );
  }

  Widget _buildPageItem(int position) {
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
             Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(left: Dimensions.width8, right: Dimensions.width8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius25),
                  color: position.isEven ? Color(0xff69c5df) : Color(0xff9294cc),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/image/food0.png'),
                  )),
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
                  child:FoodInfoColumn(text: 'Ethiopian Side',)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
