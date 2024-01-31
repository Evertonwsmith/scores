import 'package:flutter/material.dart';
import 'package:scores/curlingItem.dart';
import 'package:scores/db.dart';
import 'package:scores/styles.dart';

class loadGames extends StatefulWidget {
  const loadGames({super.key});

  @override
  State<loadGames> createState() => _loadGamesState();
}

class _loadGamesState extends State<loadGames> {
  bool init = true;
  late Future<List<curlingItem>> games;
  List items = [];

  @override
  Widget build(BuildContext context) {
    if(items.isEmpty && init == true) {
    items.addAll(loadCurlingScores() as Iterable);
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Saved Games"),
          centerTitle: true,
          backgroundColor: customStyles.appbarColor,
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(items[index].tn1 + "VS" + items[index].tn2),
              ),
            );
          },
        ));
  }
}
