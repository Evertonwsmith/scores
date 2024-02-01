import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scores/models/curlingModel.dart';
import 'package:scores/services/curlingServices.dart';
// import 'package:provider/provider.dart';

class savedCurlingGames extends StatefulWidget {
  const savedCurlingGames({super.key});

  @override
  State<savedCurlingGames> createState() => _savedCurlingGamesState();
}

class _savedCurlingGamesState extends State<savedCurlingGames> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Saved Curling Games'),
        ),
        body: StreamBuilder<List<curlingModel>>(
            stream: Provider.of<curlingServices>(context).getCurlingGames(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              List<curlingModel> result = snapshot.requireData;
              print(result.toString());
              return ListView.builder(
                  itemCount: result.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(result[index].gamename),
                      subtitle: Text(result[index].date),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => curlingDetails(model: result[index])),
                        );
                      },
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(model.gamename),
            Text(model.date),
            Text(model.team1name),
            Text(model.team2name),
            Text(model.scores.toString()),
          ],
        ),
      ),
    );
  }
}
