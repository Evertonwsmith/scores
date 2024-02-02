import 'package:flutter/material.dart';
import 'package:scores/Curling/curlingLanding.dart';
import 'package:scores/Curling/newCurlingGame.dart';
import 'package:scores/Softball/softballGame.dart';
import 'package:scores/models/softballModel.dart';
import 'package:scores/styles.dart';

class sportSel extends StatefulWidget {
  const sportSel({super.key});

  @override
  State<sportSel> createState() => _sportSelState();
}

class _sportSelState extends State<sportSel> {
  softballModel empty = softballModel('gamename', 'hometeam', 'awayteam', [],
      [], 0, 0, DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customStyles.appBar('Pageviews'),
      body: PageView(
        children: <Widget>[
          sport("Curling", landing()),
          sport("Softball", softballGame(model: empty)),
          sport("Golf", landing()),
          sport("Hockey", landing())
        ],
      ),
    );
  }

  sport(String name, destination) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      //CARD CONTAINER
      child: Container(
          decoration: customStyles.getCustomBoxDec6(),
          child: Stack(alignment: Alignment.center, children: [
            //IMAGE CONTAINER
            Container(
                height: 800,
                child: Image.asset('assets/' + name + '.jpg',
                    fit: BoxFit.fitHeight)),

            //COLOR LAYER CONTAINER
            Container(
              color: Color.fromRGBO(3, 3, 3, 0.5),
            ),
            Center(
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => destination));
                      });
                    },
                    child: Text(name, style: customStyles.pageTitleStyle))),
          ])),
    );
  }
}
