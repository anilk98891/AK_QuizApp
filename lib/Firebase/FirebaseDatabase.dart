import 'package:anilquizapp/Model/ScoreModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  final String uid;
  DataBaseService({this.uid});
  //collection references
  final CollectionReference scoreCollection =
      Firestore.instance.collection('Score');

  Future updateUserData(String score, String name) async {
    return await scoreCollection
        .document(uid)
        .setData({'score': score, 'name': name});
  }

  //gallery list from snapshot
  List<ScoreModel> _scoreListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((score) {
      return ScoreModel(
        name: score.data["name"] ?? '',score: score.data["score"] ?? ''
      );
    }).toList();
  }

//get stream
  Stream<List<ScoreModel>>get scoreCard {
    return scoreCollection.snapshots().map(_scoreListFromSnapshot);
  }
}
