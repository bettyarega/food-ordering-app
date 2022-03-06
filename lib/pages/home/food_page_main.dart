import 'package:flutter/material.dart';
import 'package:food_ordering_app/constants/colors.dart';
import 'package:food_ordering_app/pages/home/food_page_body.dart';
import 'package:food_ordering_app/widgets/sized_text.dart';
import 'package:food_ordering_app/widgets/small_text.dart';

class FoodPageMain extends StatefulWidget {
  const FoodPageMain({Key? key}) : super(key: key);

  @override
  _FoodPageStateMain createState() => _FoodPageStateMain();
}

class _FoodPageStateMain extends State<FoodPageMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedText(
                        text: 'Ethiopia',
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: 'Addis Ababa',
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      // margin: EdgeInsets.only(top: 5),
                      width: 45,
                      height: 45,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: FoodPageBody()),
        ],
      ),
    );
  }
}
