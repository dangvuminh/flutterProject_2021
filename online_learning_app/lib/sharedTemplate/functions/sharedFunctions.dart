import 'package:flutter/material.dart';
import 'dart:math';

class SharedFunctions{
  Color getRandomColorWidget(int index,double opacity){
    int randomInt = Random().nextInt(3) +6  ;
    int randomIndex = Random().nextInt(4) ;
    index += randomIndex;
    if(index == 0){
      return  Colors.red[randomInt*100].withOpacity(opacity);
    } else if(index == 1){
        return Colors.blue[randomInt*100].withOpacity(opacity);

    } else if(index == 2){
      return Colors.green[randomInt*100].withOpacity(opacity);

    } else if(index == 3){
      return Colors.brown[randomInt*100].withOpacity(opacity);

    }  else if(index == 4){
      return
       Colors.yellow[randomInt*100].withOpacity(opacity);

    } else if(index == 5){
      return
      Colors.purple[randomInt*100].withOpacity(opacity);
    } else if(index == 6){
      return
        Colors.indigo[randomInt*100].withOpacity(opacity);
    } else {
      return Colors.pink[randomInt*100].withOpacity(opacity);

    }
  }
}