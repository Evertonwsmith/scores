import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scores/Curling/curlingGame.dart';
import 'package:scores/models/curlingModel.dart';
import 'package:scores/styles.dart';

class newCurlingGame extends StatefulWidget {
  const newCurlingGame({super.key});

  @override
  State<newCurlingGame> createState() => _newCurlingGameState();
}

class _newCurlingGameState extends State<newCurlingGame> {
  final _formKey = GlobalKey<FormState>();
  DateTime now = DateTime.now();

  late curlingModel newModel = curlingModel(
      gamename: '',
      team1name: '',
      team2name: '',
      score: [],
      date: now.toString());
  bool gnselected = true;
  bool tn1 = false;
  bool tn2 = false;

  int randInt = Random().nextInt(100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customStyles.appBar("NEW CURLING GAME"),
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.85,
                  decoration: customStyles.getCustomBoxDec4(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedContainer(
                            width: gnselected ? 400 : 200,
                            duration: Duration(milliseconds: 500),
                            decoration: customStyles.getCustomBoxDec3(),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                onTap: () {
                                  setState(() {
                                    gnselected = true;
                                    tn1 = false;
                                    tn2 = false;
                                  });
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: "Game Name:",
                                    hintText: "Enter Game Name"),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value == '') {
                                    return 'Please enter a value, nerd';
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  newModel.gamename = val!;
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedContainer(
                            width: tn1 ? 400 : 200,
                            duration: Duration(milliseconds: 500),
                            decoration: customStyles.getCustomBoxDec2(),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                onTap: () {
                                  setState(() {
                                    gnselected = false;
                                    tn1 = true;
                                    tn2 = false;
                                  });
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: "Team Red Name:",
                                    hintText: "Enter Team 1 Name"),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value == '') {
                                    return 'Please enter a team name, plz n thx';
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  newModel.team1name = val!;
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedContainer(
                            width: tn2 ? 400 : 200,
                            duration: Duration(milliseconds: 500),
                            decoration: customStyles.getCustomBoxDec(),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                onTap: () {
                                  setState(() {
                                    gnselected = false;
                                    tn1 = false;
                                    tn2 = true;
                                  });
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: "Team Yellow Name:",
                                    hintText: "Enter Team 2 Name"),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value == '') {
                                    return 'Please enter a team name?';
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  newModel.team2name = val!;
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                            child: Text('Submit'),
                            onPressed: () async {
                              print('pressed');
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                await FirebaseFirestore.instance
                                    .collection('scores')
                                    .doc(newModel.gamename)
                                    .set({
                                  'gamename': newModel.gamename,
                                  'team1name': newModel.team1name,
                                  'team2name': newModel.team2name,
                                  'score': newModel.score,
                                  'date': newModel.date,
                                });
                                print('saved');
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return curlingGame(model: newModel);
                                }));
                              }
                            }),
                      ]),
                ),
              )),
        ));
  }
}
