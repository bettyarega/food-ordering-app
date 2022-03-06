import 'package:flutter/material.dart';
import 'package:food_ordering_app/constants/colors.dart';
import 'package:food_ordering_app/constants/dimensions.dart';
import 'package:food_ordering_app/widgets/icon_and_text_widget.dart';
import 'package:food_ordering_app/widgets/sized_text.dart';
import 'package:food_ordering_app/widgets/small_text.dart';

class FoodInfoColumn extends StatelessWidget {
  final String text;
  const FoodInfoColumn({ Key? key, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedText(text: text,size: Dimensions.font21,),
                      SizedBox(
                        height: Dimensions.height8,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      color: AppColors.mainColor,
                                      size: Dimensions.iconSize12,
                                    )),
                          ),
                          SizedBox(width: Dimensions.width8),
                          SmallText(text: '4.5'),
                          SizedBox(width: Dimensions.width8),
                          SmallText(text: '1287'),
                          SizedBox(width: Dimensions.width8),
                          SmallText(text: 'comments'),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height16,
                      ),
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
                      )
                    ],
    );
  }
}