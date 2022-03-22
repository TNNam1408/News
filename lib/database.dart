import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  late FirebaseFirestore firestore;

  initilase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<List?> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore.collection('news').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {"id": doc.id, "name": doc['name'], "code": doc['content']};
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
  }
}