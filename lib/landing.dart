import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:scores/curling.dart';
import 'package:scores/loadGames.dart';
import 'package:scores/styles.dart';

class landing extends StatelessWidget {
  const landing({super.key});

  @override
  Widget build(BuildContext context) {
    String team1 ='1';
    String team2 ='2';
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: customStyles.appbarColor,
          title: Text('Title A',style: customStyles.mainTextStyleY(),),
          centerTitle: true,
          elevation: 5,
        ),
        body: Container(
          decoration: customStyles.getCustomBoxDec4(),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => curling(team1: team1,team2: team2)),
                    );
                  },
                  child: Container(
                      width: 100, height: 100,
                      decoration: customStyles.appDecor(),
                      child: Icon(LineIcons.rocket, size: 100,color: customStyles.y)),
                ),
                //////////////////////////////////
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => loadGames()),
                    );
                  },
                  child: Container(
                      width: 100, height: 100,
                      decoration: customStyles.appDecor(),
                      child: Icon(LineIcons.hamburger, size: 100,color: customStyles.y)),
                ),
              ],
            ),
          ),
        ));
  }
}
