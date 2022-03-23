
import 'package:flutter/material.dart';
import 'package:news/provider/database.dart';
import 'package:news/provider/news_saved_provider.dart';
import 'package:news/screens/listproduct.dart';
import 'package:provider/provider.dart';
class SaveScreen extends StatelessWidget {
  SaveScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tin đã lưu"),
      ),
      body: Consumer<NewsSavedProvider>(
        builder: (context,newsSaved,child){

          return ListProduct(
            name: 'tin đã lưu',
            snapShot: newsSaved.news,
          );

        },
      ),
    );
  }
}
