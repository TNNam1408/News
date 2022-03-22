import 'package:flutter/material.dart';
import 'package:news/model/category.dart';
import 'package:news/model/product.dart';
import 'package:news/provider/database.dart';
import 'package:provider/provider.dart';

import 'listproduct.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
Database databaseProvider;
class _HomeScreenState extends State<HomeScreen> {
  Widget _buildCategoryName({String name}) {
    return Container(
      color: Colors.amber,
      height: 40,
      width: 100,
      child: Text(
        "$name",
        style:const TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _BuildTinNong() {
    List<Product> tinnong = databaseProvider.getTinNongList;
    List<Category> tinnongname =
        databaseProvider.getTinNongNameList;
    return Row(
      children: tinnongname.map((e) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => ListProduct(
                  name: "Tin Nóng",
                  snapShot: tinnong,
                ),
              ),
            );
          },
          child: _buildCategoryName(name: e.name),
        );
      }).toList(),
    );
  }

  Widget _buildCategory() {
     return Column(
      children: [
        Container(
          color: Colors.greenAccent,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _BuildTinNong(),
            ],
          ),
        ),
      ],
    );
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    databaseProvider= Provider.of<Database>(context);
    databaseProvider.getTinNongData();
    databaseProvider.getTinNongNameData();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "HomePage",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[400],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        color: Colors.grey[200],
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategory(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
