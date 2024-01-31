import 'dart:convert';

import 'package:flutter/material.dart';

class curlingItem  {


  final String tn1;
  final String tn2;
  final String sc1;
  final String sc2;
  final String sc3;
  final String sc4;
  final String sc5;
  final String sc6;

  const curlingItem(
      {
      required this.tn1,
      required this.tn2,
      required this.sc1,
      required this.sc2,
      required this.sc3,
      required this.sc4,
      required this.sc5,
      required this.sc6});

  factory(
          {required String tn1,
          required String tn2,
          required String sc1,
          required String sc2,
          required String sc3,
          required String sc4,
          required String sc5,
          required String sc6}) =>
      curlingItem(
        tn1: tn1,
        tn2: tn2,
        sc1: sc1,
        sc2: sc2,
        sc3: sc3,
        sc4: sc4,
        sc5: sc5,
        sc6: sc6,
      );

}
