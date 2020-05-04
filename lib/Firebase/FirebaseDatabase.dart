import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:userstories/Models/GalleryModel.dart';

class DataBaseService {
  final String uid;
  DataBaseService({this.uid});
  //collection references
  final CollectionReference galleryCollection =
      Firestore.instance.collection('Gallery');

  Future updateUserData(String location, String name) async {
    return await galleryCollection
        .document(uid)
        .setData({'location': location, 'name': name});
  }

  //gallery list from snapshot
  List<GalleryModel> _galleryListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((e) {
      return GalleryModel(e.data['name'] ?? "", e.data['location'] ?? "");
    }).toList();
  }

//get stream
  Stream<List<GalleryModel>> get gallery {
    return galleryCollection.snapshots().map(_galleryListFromSnapshot);
  }
}
