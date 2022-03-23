import 'package:flutter/cupertino.dart';
import 'package:news/model/news.dart';

class NewsSavedProvider extends ChangeNotifier {
  List<News> news =  [];

  void addNew(News n) {
    news.add(n);
    notifyListeners();
  }

  void deleteNew(News n) {
    news.remove(n);
    notifyListeners();
  }

}