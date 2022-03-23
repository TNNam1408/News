import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:news/model/category.dart';
import 'package:news/model/news.dart';
class Database with ChangeNotifier{

  List<Category> tinnongName = [];
  Category tinnongNameData;

  Future<void> getTinNongNameData() async {
    List<Category> newList = [];
    QuerySnapshot tinnongNameSnapShot = await Firestore.instance
        .collection("categoryname")
        .document("rE5oUaBClNTUWDy8amQd")
        .collection("tinnong")
        .getDocuments();
    for (var element in tinnongNameSnapShot.documents) {
            tinnongNameData = Category(name: element.data["name"]);
        newList.add(tinnongNameData);
      }
    tinnongName = newList;
    notifyListeners();
  }

  List<Category> get getTinNongNameList {
    return tinnongName;
  }

  List<News> tinnong = [];
  News tinnongData;

  Future<void> getTinNongData() async {
    List<News> newList = [];
    QuerySnapshot tinnongSnapShot = await Firestore.instance
        .collection("category")
        .document("uvgkdVblH7EbyLnwqtW7")
        .collection("tinnong")
        .getDocuments();
    for (var element in tinnongSnapShot.documents) {
            tinnongData = News(
            name: element.data["name"],
                image: element.data["image"],
                time: element.data["time"],
            content: element.data["content"]);
        newList.add(tinnongData);
      }
    tinnong = newList;
    notifyListeners();
  }

  List<News> get getTinNongList {
    return tinnong;
  }
  //---------------------------------
  List<Category> sanphamsoName = [];
  Category sanphamsoNameData;

  Future<void> getSanPhamSoNameData() async {
    List<Category> newList = [];
    QuerySnapshot sanphamsoNameSnapShot = await Firestore.instance
        .collection("categoryname")
        .document("rE5oUaBClNTUWDy8amQd")
        .collection("sanphamso")
        .getDocuments();
    for (var element in sanphamsoNameSnapShot.documents) {
      sanphamsoNameData = Category(name: element.data["name"]);
      newList.add(sanphamsoNameData);
    }
    sanphamsoName = newList;
    notifyListeners();
  }

  List<Category> get getSanPhamSoNameList {
    return sanphamsoName;
  }

  List<News> sanphamso = [];
  News sanphamsoData;

  Future<void> getSanPhamSoData() async {
    List<News> newList = [];
    QuerySnapshot sanphamsoSnapShot = await Firestore.instance
        .collection("category")
        .document("uvgkdVblH7EbyLnwqtW7")
        .collection("sanphamso")
        .getDocuments();
    for (var element in sanphamsoSnapShot.documents) {
      sanphamsoData = News(
          name: element.data["name"],
          image: element.data["image"],
          time: element.data["time"],
          content: element.data["content"]);
      newList.add(sanphamsoData);
    }
    sanphamso = newList;
    notifyListeners();
  }

  List<News> get getSanPhamSoList {
    return sanphamso;
  }
}