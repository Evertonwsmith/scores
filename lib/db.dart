import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scores/curlingItem.dart';

curlingItem getCurlingItem(String data) {
  curlingItem result;
  List<String> items = data.split('%');
  result = curlingItem(
      tn1: items[0],
      tn2: items[1],
      sc1: items[2],
      sc2: items[3],
      sc3: items[4],
      sc4: items[5],
      sc5: items[6],
      sc6: items[7]);
  return result;
}

String setData(curlingItem cI) {
  String data = cI.tn1 + '%';
  data += cI.tn2 + '%';
  data += cI.sc1 + '%';
  data += cI.sc2 + '%';
  data += cI.sc3 + '%';
  data += cI.sc4 + '%';
  data += cI.sc5 + '%';
  data += cI.sc6 + '%';
  return data;
}

Future<void> saveCurlingGame(curlingItem CI, String docNam) async {
  try {
    FirebaseFirestore.instance
        .collection('scores')
        .doc(docNam)
        .set({'data': setData(CI)}).then((_) {
      print('Document written with ID: $docNam');
    });
  } catch (e) {
    print('Error adding document: $e');
  }
}

Future<void> upload(String data, String docName) async {
  try {
    await FirebaseFirestore.instance.collection('scores').doc(docName).set({
      'data': data,
    });
    print('Data Uploaded to Firestore Successfully');
  } catch (e) {
    print('Error uploading data to Firestore: $e');
  }
}

Future<List<curlingItem>> loadCurlingScores() async {
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('scores').get();

    List<curlingItem> temp = [];
    for (QueryDocumentSnapshot document in querySnapshot.docs) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      if (data['data'] != null) {
        temp.add(getCurlingItem(data['data']));
        // TODO: IS THIS NEEDED? ITEMS UPDATED ONSCREEN BEFORE SAVED. COMBINE OR DELETE
      }
    }
    return temp;
  } catch (e) {
    print('Error retrieving data from Firestore: $e');
  }
  return [];
}

Future<void> loadItems(int id) async {
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('scores').get();

    List<curlingItem> temp = [];
    for (QueryDocumentSnapshot document in querySnapshot.docs) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      if (data['data'] != null && data.containsValue(id)) {
        temp.add(getCurlingItem(data['data']));
        // TODO: IS THIS NEEDED? ITEMS UPDATED ONSCREEN BEFORE SAVED. COMBINE OR DELETE
      }
    }
  } catch (e) {
    print('Error retrieving data from Firestore: $e');
  }
}

Future<void> deleteItem(String doc) async {
  try {
    await FirebaseFirestore.instance.collection('scores').doc(doc).delete();
  } catch (e) {
    print('Error deleting document: $e');
  }
}
