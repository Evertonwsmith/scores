import 'package:flutter/material.dart';

class customStyles {

  static double stdboxht = 200.0;
  static double stdboxwd = 200.0;
  static Color appbarColor = Colors.green[800]!;

  static BoxDecoration appDecor(){
    return BoxDecoration(
      color: Colors.green[700],
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 10)],
      borderRadius: BorderRadius.all(Radius.circular(25))
    );
  }
  static BoxDecoration getStyledBoxDecoration(bool pressed) {
    return BoxDecoration(
      border: Border.all(
        color: pressed ? Colors.red : Colors.blue,
      ),
      borderRadius: BorderRadius.circular(50),
      color: pressed ? Colors.yellow : Colors.green,
    );
  }

  static BoxDecoration getCustomBoxDec(){
    return BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 10,
      ),
      borderRadius: BorderRadius.circular(20),
      color: Colors.grey[300]!,
    );
  }

  static BoxDecoration getCustomBoxDec2(){
    return BoxDecoration(
      border: Border.all(
        color: Colors.yellow[400]!,
        width: 10,
      ),
      borderRadius: BorderRadius.circular(50),
      color: Colors.white,
    );
  }

  static BoxDecoration getCustomBoxDec3(){
    return BoxDecoration(
      border: Border.all(
        color: Colors.red[700]!,
        width: 10,
      ),
      borderRadius: BorderRadius.circular(50),
      color: Colors.white,
    );
  }

  static BoxDecoration getCustomBoxDec4(){
    return BoxDecoration(
      border: Border.all(
        color: Colors.green[400]!,
        width: 10,
      ),
      color: Colors.green[300]!,
    );
  }

  static TextStyle mainTextStyle(){
    return TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
      wordSpacing: 2,
    );

  }

  static TextStyle mainTextStyleY(){
    return TextStyle(
      color: Colors.yellow[300],
      fontSize: 30,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
      wordSpacing: 2,
    );

  }
  static Color y = Colors.yellow[300]!;
}