import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:scores/models/curlingModel.dart';
import 'package:scores/models/softballModel.dart';
import 'package:scores/softballStyles.dart';

class softballGame extends StatefulWidget {
  final softballModel model;

  softballGame({super.key, required this.model});

  @override
  State<softballGame> createState() => _softballGameState();
}

class _softballGameState extends State<softballGame> {
  final _formKey = GlobalKey<FormState>();
  bool init = true;

  @override
  Widget build(BuildContext context) {
    if (init) {
      init = false;
    }

    return Scaffold(
        appBar: customStyles.appBar(widget.model.gamename),
        body: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              decoration: customStyles.getCustomBoxDec4(),
              child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: customStyles.getCustomBoxDec2(),
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(widget.model.teamATotal.toString(),
                                      style: customStyles.mainTextStyle()),
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () async {
                                    print('pressed');
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      await FirebaseFirestore.instance
                                          .collection('softballscores')
                                          .doc(widget.model.gamename)
                                          .set({
                                        'gamename': widget.model.gamename,
                                        'hometeamname': widget.model.hometeam,
                                        'awayteamname': widget.model.awayteam,
                                        'homeScores': widget.model.teamAscores,
                                        'awayScores': widget.model.teamBscores,
                                        'homeTotal': widget.model.teamATotal,
                                        'awayTotal': widget.model.teamBTotal,
                                        'date': widget.model.date,
                                      });
                                      print('saved');
                                    }
                                  },
                                  child: Text('save')),
                              Container(
                                decoration: customStyles.getCustomBoxDec(),
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(widget.model.teamBTotal.toString(),
                                      style: customStyles.mainTextStyle()),
                                ),
                              ),
                            ],
                          ),
                          teamNameRow(
                              widget.model.hometeam, widget.model.awayteam),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                scoreRow(0),
                                scoreRow(1),
                                scoreRow(2),
                                scoreRow(3),
                                scoreRow(4),
                                scoreRow(5),
                                scoreRow(6),
                                scoreRow(7),
                                scoreRow(8),
                              ],
                            )
                          ),
                        ]),
                  )),
            ),
          )),
        ));
  }

  teamNameRow(String t1n, String t2n) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              t1n + " VS ",
              style: customStyles.mainTextStyle(),
            ),
            Text(
              t2n,
              style: customStyles.mainTextStyle(),
            ),
          ],
        ),
      ),
    );
  }

  scoreRow(int i) {
    if(widget.model.teamAscores == null || widget.model.teamAscores.length <= i ){
      return SizedBox(height: 0);
    }
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.model.teamAscores[i].toString(),
              style: customStyles.mainTextStyle(),
            ),
            Text(
              widget.model.teamBscores[i].toString(),
              style: customStyles.mainTextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
