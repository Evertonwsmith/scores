import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scores/models/curlingModel.dart';

class curlingServices {
  final CollectionReference curlingCollection =
      FirebaseFirestore.instance.collection('scores');

  Stream<List<curlingModel>> getCurlingGames() {
    return curlingCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return curlingModel(
            gamename: data['gamename'],
            team1name: data['team1name'],
            team2name: data['team2name'],
            score: data['scores'],
            date: data['date']);
      }).toList();
    });
  }
}
