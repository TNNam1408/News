import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news/provider/database.dart';
import 'package:news/provider/news_saved_provider.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/screens/save_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Database>(
            create: (ctx) => Database(),
          ),
          ChangeNotifierProvider<NewsSavedProvider>(
              create: (context) => NewsSavedProvider())
        ],
        child: HomeScreen(),
      ),
    );
  }
}
