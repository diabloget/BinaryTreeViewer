import 'package:binary_tree_viewer/sizeConfig.dart';
import 'package:flutter/material.dart';

class ReusableWidgets{


  static Container nodeContainer(text, color){
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(color: Colors.deepPurple, width: SizeConfig.fixLil * 4)
      ),
      width: SizeConfig.fixLilHor * 80,
      height: SizeConfig.fixLilVer * 40,
      child: Center(
        child: RotatedBox(
          quarterTurns: 1,
          child: Text(text, textScaleFactor: SizeConfig.fixLil*2.8),
        ),
      )
    );
  }



}