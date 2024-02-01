import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scores/models/curlingModel.dart';
import 'package:scores/styles.dart';

class curlingGame extends StatefulWidget {
  final curlingModel model;

  curlingGame({super.key, required this.model});

  @override
  State<curlingGame> createState() => _curlingGameState();
}

class _curlingGameState extends State<curlingGame> {
  final _formKey = GlobalKey<FormState>();
  bool init = true;
  List<bool> redbools = [false, false, false, false, false, false];
  List<bool> yellowbools = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    if (init && widget.model.score.isEmpty) {
      widget.model.score = [
        66,
        99,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
      ];
      init = false;
    }

    int rtotal = widget.model.score[0] +
        widget.model.score[2] +
        widget.model.score[4] +
        widget.model.score[6] +
        widget.model.score[8] +
        widget.model.score[10];
    int ytotal = widget.model.score[1] +
        widget.model.score[3] +
        widget.model.score[5] +
        widget.model.score[7] +
        widget.model.score[11];
    return Scaffold(
      appBar: customStyles.appBar(widget.model.gamename),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: customStyles.getCustomBoxDec4(),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: customStyles.getCustomBoxDec2(),
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(rtotal.toString(),
                                style: customStyles.mainTextStyle()),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              print('pressed');
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                await FirebaseFirestore.instance
                                    .collection('scores')
                                    .doc(widget.model.gamename)
                                    .set({
                                  'gamename': widget.model.gamename,
                                  'team1name': widget.model.team1name,
                                  'team2name': widget.model.team2name,
                                  'scores': widget.model.score,
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
                            child: Text(ytotal.toString(),
                                style: customStyles.mainTextStyle()),
                          ),
                        ),
                      ],
                    ),
                    teamNameRow(widget.model.team1name, widget.model.team2name),
                    Form(
                        key: _formKey,
                        child: Column(children: [
                          scoreRow(1),
                          scoreRow(2),
                          scoreRow(3),
                          scoreRow(4),
                          scoreRow(5),
                          scoreRow(6)
                        ]))
                  ],
                ),
              )),
        )),
      ),
    );
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
    int findScoreInd(int x) {
      return i == 1
          ? x == 0
              ? 0
              : 1
          : i == 2
              ? x == 0
                  ? 2
                  : 3
              : i == 3
                  ? x == 0
                      ? 4
                      : 5
                  : i == 4
                      ? x == 0
                          ? 6
                          : 7
                      : i == 5
                          ? x == 0
                              ? 8
                              : 9
                          : -1;
    }

    int sc1 = 0;
    int sc2 = 0;
    int ind = 0;
    switch (i) {
      case 1:
        sc1 = widget.model.score[0];
        sc2 = widget.model.score[1];
        ind = 0;
        break;
      case 2:
        sc1 = widget.model.score[2];
        sc2 = widget.model.score[3];
        ind = 1;
        break;
      case 3:
        sc1 = widget.model.score[4];
        sc2 = widget.model.score[5];
        ind = 2;
        break;
      case 4:
        sc1 = widget.model.score[6];
        sc2 = widget.model.score[7];
        ind = 3;
        break;
      case 5:
        sc1 = widget.model.score[8];
        sc2 = widget.model.score[9];
        ind = 4;
        break;
      case 6:
        sc1 = widget.model.score[10];
        sc2 = widget.model.score[11];
        ind = 5;
        break;
      default:
    }
    if (sc1 != 0) {
      redbools[ind] = true;
      yellowbools[ind] = false;
    }
    if (sc2 != 0) {
      yellowbools[ind] = true;
      redbools[ind] = false;
    }

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: customStyles.getCustomBoxDec3(),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(
                child: Text("END: " + i.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ),
          SizedBox(width: 5),
          GestureDetector(
            onDoubleTap: () {
              setState(() {
                redbools[ind] = true;
                yellowbools[ind] = false;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: redbools[ind] == true
                  ? MediaQuery.of(context).size.width * 0.30
                  : MediaQuery.of(context).size.width * 0.10,
              height: redbools[ind] == true
                  ? MediaQuery.of(context).size.width * 0.30
                  : MediaQuery.of(context).size.width * 0.10,
              decoration: customStyles.getCustomBoxDec2(),
              child: Center(
                child: GestureDetector(
                  onLongPress: () {
                    setState(() {
                      sc1 = 0;
                      widget.model.score[findScoreInd(0)] = sc1;
                    });
                  },
                  onTap: () {
                    setState(() {
                      sc1++;
                      widget.model.score[findScoreInd(0)] = sc1;
                      sc2 = 0;
                      widget.model.score[findScoreInd(1)] = sc2;
                    });
                  },
                  child: Text(
                    sc1.toString(),
                    style: redbools[ind] == true
                        ? customStyles.scoreSelDec()
                        : customStyles.scoreHidDec(),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onDoubleTap: () {
              setState(() {
                redbools[ind] = false;
                yellowbools[ind] = true;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: yellowbools[ind] == true
                  ? MediaQuery.of(context).size.width * 0.30
                  : MediaQuery.of(context).size.width * 0.10,
              height: yellowbools[ind] == true
                  ? MediaQuery.of(context).size.width * 0.30
                  : MediaQuery.of(context).size.width * 0.10,
              decoration: customStyles.getCustomBoxDec(),
              child: Center(
                child: GestureDetector(
                  onLongPress: () {
                    setState(() {
                      sc1 = 0;
                      widget.model.score[findScoreInd(0)] = sc1;
                    });
                  },
                  onTap: () {
                    setState(() {
                      sc2++;
                      widget.model.score[findScoreInd(1)] = sc2;
                      sc1 = 0;
                      widget.model.score[findScoreInd(0)] = sc1;
                    });
                  },
                  child: Text(
                    sc2.toString(),
                    style: yellowbools[ind] == true
                        ? customStyles.scoreSelDec()
                        : customStyles.scoreHidDec(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
