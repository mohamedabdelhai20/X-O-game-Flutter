import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_o_game/app_colors.dart';

class BoardButton extends StatelessWidget {
String text;
int index;
Function onButtonClick;
BoardButton({required this.index,required this.text,required this.onButtonClick});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.purple_two
            ),
              onPressed: (){

              onButtonClick(index);
              },
          child: Text(text,style:  TextStyle(color: AppColors.yellow,fontSize: 100,fontWeight: FontWeight.bold))),
        ));
  }
}
