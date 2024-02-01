import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class customStyles {
  static double stdboxht = 200.0;
  static double stdboxwd = 200.0;
  static Color appbarColor = Colors.green[800]!;

  static BoxDecoration appDecor() {
    return BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10)
        ],
        borderRadius: BorderRadius.all(Radius.circular(25)));
  }

  static AppBar appBar(String text) {
    return AppBar(
      title: FittedBox(
        child: Text(text,
            style: GoogleFonts.josefinSans(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            )),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue[500],
      elevation: 20,
    );
  }

  static TextStyle scoreSelDec() {
    return TextStyle(
        color: Colors.black,
        fontSize: 50,
        fontWeight: FontWeight.bold,
        decorationStyle: TextDecorationStyle.solid,
        decorationThickness: 2,
        decorationColor: Colors.green[800]!);
  }

  static TextStyle scoreHidDec() {
    return TextStyle(
      fontSize: 0,
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

  static BoxDecoration getCustomBoxDec() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.yellow[700]!,
        width: 5,
      ),
      borderRadius: BorderRadius.circular(50),
      color: Colors.yellow[50]!,
    );
  }

  static BoxDecoration getCustomBoxDecSel() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.yellow[700]!,
        width: 5,
      ),
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    );
  }

  static BoxDecoration getCustomBoxDec2() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.red[400]!,
        width: 5,
      ),
      borderRadius: BorderRadius.circular(50),
      color: Colors.red[50],
    );
  }

  static BoxDecoration getCustomBoxDec3() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.blue[700]!,
        width: 10,
      ),
      borderRadius: BorderRadius.circular(50),
      color: Colors.white,
    );
  }

  static BoxDecoration getCustomBoxDec4() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.blue[400]!,
        width: 10,
      ),
      color: Colors.blue[300]!,
    );
  }

  static BoxDecoration getCustomBoxDec5() {
    return BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      border: Border.all(
        color: Colors.blue[400]!,
        width: 10,
      ),
      color: Colors.blue[100]!,
    );
  }

  static TextStyle mainTextStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
      wordSpacing: 2,
    );
  }

  static TextStyle mainTextStyleY() {
    return TextStyle(
      color: Colors.yellow[300],
      fontSize: 30,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
      wordSpacing: 2,
    );
  }

  static Color y = Colors.blue[800]!;

  static TextStyle pageTitleStyle = GoogleFonts.josefinSans(
      textStyle: TextStyle(
    color: Colors.white,
    fontSize: 80.0,
    fontWeight: FontWeight.bold,
  ));

  static BoxDecoration getCustomBoxDec6() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.blue[400]!,
        width: 10,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      color: Colors.blue[100]!,
    );
  }
}
