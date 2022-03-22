import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:news/model/category.dart';
import 'package:news/model/product.dart';
class Database with ChangeNotifier{
  // late FirebaseFirestore firestore;
  //
  // initilase() {
  //   firestore = FirebaseFirestore.instance;
  // }
  //
  // Future<List?> read() async {
  //   QuerySnapshot querySnapshot;
  //   List docs = [];
  //   try {
  //     querySnapshot = await firestore.collection('category').get();
  //     if (querySnapshot.docs.isNotEmpty) {
  //       for (var doc in querySnapshot.docs.toList()) {
  //         Map a = {"id": doc.id, "name": doc['name'], "content": doc['content']};
  //         docs.add(a);
  //       }
  //       return docs;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  List<Category> tinnongName = [];
  Category tinnongNameData;

  Future<void> getTinNongNameData() async {
    List<Category> newList = [];
    QuerySnapshot performanceIconSnapShot = await Firestore.instance
        .collection("categoryname")
        .document("rE5oUaBClNTUWDy8amQd")
        .collection("tinnong")
        .getDocuments();
    for (var element in performanceIconSnapShot.documents) {
            tinnongNameData = Category(name: element.data["name"]);
        newList.add(tinnongNameData);
      }
    tinnongName = newList;
    notifyListeners();
  }

  List<Category> get getTinNongNameList {
    return tinnongName;
  }

  List<Product> tinnong = [];
  Product tinnongData;

  Future<void> getTinNongData() async {
    List<Product> newList = [];
    QuerySnapshot performanceSnapShot = await Firestore.instance
        .collection("category")
        .document("uvgkdVblH7EbyLnwqtW7")
        .collection("tinnong")
        .getDocuments();
    for (var element in performanceSnapShot.documents) {
            tinnongData = Product(
            name: element.data["name"],
                image: element.data["image"],
                time: element.data["time"],
            content: element.data["content"]);
        newList.add(tinnongData);
      }
    tinnong = newList;
    notifyListeners();
  }

  List<Product> get getTinNongList {
    return tinnong;
  }
}