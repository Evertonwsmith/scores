import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
      scores: [],
      date: now.toString());
  bool gnselected = false;
  bool tn1 = false;
  bool tn2 = false;

  //
  // void changeNewModel(curlingModel modelChanges) {
  //   setState(() {
  //     newModel = modelChanges;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New Curling Game"),
          centerTitle: true,
          backgroundColor: Colors.green[300],
          elevation: 20,
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  decoration: customStyles.getCustomBoxDec4(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedContainer(
                            width: gnselected ? 400 : 200,
                            duration: Duration(milliseconds: 500),
                            decoration: customStyles.getCustomBoxDec(),
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
                                    labelText: "Game Name:",
                                    hintText: "Enter Game Name"),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
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
                            decoration: customStyles.getCustomBoxDec(),
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
                                    labelText: "Team 1 Name:",
                                    hintText: "Enter Team 1 Name"),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
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
                                    labelText: "Team 2 Name:",
                                    hintText: "Enter Team 2 Name"),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
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
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                await FirebaseFirestore.instance
                                    .collection('scores')
                                    .doc(newModel.gamename)
                                    .set({
                                  'gamename': newModel.gamename,
                                  'team1name': newModel.team1name,
                                  'team2name': newModel.team2name,
                                  'scores': [
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
                                    0,
                                    0
                                  ],
                                  'date': now.toString(),
                                });
                              }
                              ;
                            }),
                      ]),
                ),
              )),
        ));
  }
}
