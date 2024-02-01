import 'package:flutter/material.dart';

double screenWidth(context, double x) {
  return MediaQuery.of(context).size.width * x;
}

double screenHeight(context, double x) {
  return MediaQuery.of(context).size.height * x;
}