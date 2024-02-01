import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:scores/curlingGame.dart';
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
    return GestureDetector(
      onDoubleTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => curlingGame(model: model)),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(

            child: Column(
              children: [
                Text(model.gamename),
                Text(model.date),
                Text(model.team1name),
                Text(model.team2name),
                Text(model.score.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
