import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:scores/Curling/newCurlingGame.dart';
import 'package:scores/Curling/savedCurlingGames.dart';
import 'package:scores/sportSel.dart';
import 'package:scores/styles.dart';

class landing extends StatelessWidget {
  const landing({super.key});

  @override
  Widget build(BuildContext context) {
    String team1 = '1';
    String team2 = '2';
    return Scaffold(
        appBar: customStyles.appBar("CURLING!"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: customStyles.getCustomBoxDec4(),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => newCurlingGame()),
                      );
                    },
                    child: Container(
                        width: 100,
                        height: 100,
                        decoration: customStyles.appDecor(),
                        child: Icon(LineIcons.plusCircle,
                            size: 100, color: customStyles.y)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => savedCurlingGames()),
                      );
                    },
                    child: Container(
                        width: 100,
                        height: 100,
                        decoration: customStyles.appDecor(),
                        child: Icon(LineIcons.infoCircle,
                            size: 100, color: customStyles.y)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => sportSel()),
                      );
                    },
                    child: Container(
                        width: 100,
                        height: 100,
                        decoration: customStyles.appDecor(),
                        child: Icon(LineIcons.chevronCircleRight,
                            size: 100, color: customStyles.y)),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
