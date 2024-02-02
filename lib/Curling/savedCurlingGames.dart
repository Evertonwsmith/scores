import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:scores/Curling/curlingGame.dart';
import 'package:scores/models/curlingModel.dart';
import 'package:scores/services/curlingServices.dart';
import 'package:scores/styles.dart';

class savedCurlingGames extends StatefulWidget {
  const savedCurlingGames({super.key});

  @override
  State<savedCurlingGames> createState() => _savedCurlingGamesState();
}

class _savedCurlingGamesState extends State<savedCurlingGames> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customStyles.appBar("Saved Curling Games"),
        body: StreamBuilder<List<curlingModel>>(
            stream: Provider.of<curlingServices>(context).getCurlingGames(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              List<curlingModel> result = snapshot.requireData;
              print(result.toString());
              return ListView.builder(
                  padding: EdgeInsets.all(20),
                  itemCount: result.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: customStyles.getCustomBoxDec5(),
                      child: ListTile(
                        title: Text(result[index].gamename),
                        subtitle: Text(result[index].date),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    curlingDetails(model: result[index])),
                          );
                        },
                      ),
                    );
                  });
            }));
  }
}

class curlingDetails extends StatelessWidget {
  final curlingModel model;

  const curlingDetails({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customStyles.appBar(model.gamename),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              decoration: customStyles.getCustomBoxDec6(),
              child: Column(
                children: [
                  gameSheet(model),
                  // Container(
                  //   child: Center(child: Text(model.score.toString())),
                  // )
                ],
              )),
          GestureDetector(
            onDoubleTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => curlingGame(model: model)),
              );
            },
            child: Center(
              child: Card(
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: Colors.blue[100],
                  onTap: () {
                    print('tapped saved game');
                  },
                  child: SizedBox(
                    height: 50,
                    width: 300,
                    child: Center(
                      child: Text(
                        'LOAD',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  gameSheet(curlingModel model) {
    return Container(
        child: Center(
            child: Column(children: [
      Text(model.team1name + ' vs ' + model.team2name,
          style: customStyles().stats),
      Text(tidyDate(model.date), style: customStyles().stats),
      Text(printScore(model), style: customStyles().stats)
    ])));
  }
}

String printScore(curlingModel model) {
  int rtotal = model.score[0] +
      model.score[2] +
      model.score[4] +
      model.score[6] +
      model.score[8] +
      model.score[10];
  int ytotal = model.score[1] +
      model.score[3] +
      model.score[5] +
      model.score[7] +
      model.score[9] +
      model.score[11];

  return "Red :" + rtotal.toString() + "  | Yellow :" + ytotal.toString();
}

String tidyDate(String date){
  return date.substring(0, 10);
}