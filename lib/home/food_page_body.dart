import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
          itemCount: 5,
          itemBuilder: (context, pos) {
            return _buildPageItem(pos);
          }),
    );
  }

  Widget _buildPageItem(int position) {
    return Container(
      height: 220,
      margin: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: position.isEven ? Color(0xff69c5df) : Color(0xff9294cc),
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('asets/image/food0.png'))),
    );
  }
}
