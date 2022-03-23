import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class News {

  final String name;
  final String image;
  final String content;
  final Timestamp time;
   News({@required this.name,@required this.image,@required this.content,@required this.time});
}
