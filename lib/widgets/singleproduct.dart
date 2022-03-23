import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:news/provider/news_saved_provider.dart';
import 'package:news/screens/detail_screen.dart';
import 'package:provider/provider.dart';

class SingleProduct extends StatelessWidget {
  final String name;
  final String image;
  final String content;
  final Timestamp time;

  SingleProduct({Key key, this.name, this.image, this.content, this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider.value(
              value: context.read<NewsSavedProvider>(),
              child: DetailScreen(
                    name: name,
                    time: time,
                    image: image,
                    content: content,
                  ),
            )));
      },
      child: Card(
        child: Container(
          height: 200,
          width: double.infinity,
          color: Colors.grey[200],
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 60,
                    width: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill, image: NetworkImage(image)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 250,
                      child: Text(
                        "${name}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color(0xff9b96d6)),
                      ),
                    ),
                    Text(
                      "${DateTime.parse(time.toDate().toString()).toString()}",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 250,
                      child: Text(
                        content,
                        //maxLines: 3,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
