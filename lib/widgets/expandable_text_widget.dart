import 'package:flutter/material.dart';
import 'package:food_ordering_app/constants/colors.dart';
import 'package:food_ordering_app/constants/dimensions.dart';
import 'package:food_ordering_app/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({ Key? key, required this.text }) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = false;
  double textHeight = Dimensions.screenHeight/4.61;

  @override
  void initState() {
      super.initState();
      if(widget.text.length>textHeight){
        firstHalf = widget.text.substring(0,textHeight.toInt());
        secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
      }else{
        firstHalf = widget.text;
        secondHalf = "";
      }
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      // height: textHeight,
      child: secondHalf.isEmpty?SmallText(color: AppColors.paraColor, size: Dimensions.font14, text: firstHalf): Column(
        children: [
          SmallText(height: 1.6, color: AppColors.paraColor, size: Dimensions.font14, text: hiddenText?(firstHalf +"..."):(firstHalf+secondHalf)),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText = !hiddenText;
              });
              print('=======================');
            },
            child: Row(
              children: [
                SmallText(text: hiddenText ? "Show more": "Show less", color: AppColors.mainColor,),
                Icon(hiddenText? Icons.arrow_drop_down : Icons.arrow_drop_up, color: AppColors.mainColor,),
              ],
            ),
          )
        ],
      ),
    );
  }
}