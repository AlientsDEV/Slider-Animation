import 'package:flutter/material.dart';


class BuildColumn extends StatelessWidget{

  final CrossAxisAlignment crossAxisAlignment;
  final String title;
  final String subTitle;

  BuildColumn({
      this.crossAxisAlignment,
      this.title,
      this.subTitle
  });


  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
         Text(
           title,
           style: TextStyle(
             color: Colors.white,
             fontWeight: FontWeight.w800,
             fontSize: 17.0
           ),
         ),
         Text(
           subTitle,
           style: TextStyle(
               color: Colors.white,
               fontSize: 12.0
           ),
         ),
      ],
    );
  }

}