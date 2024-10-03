import 'package:flutter/material.dart';
import 'package:news_app_demo_flutter/newsfeature/CubitCaseProvider.dart';
import 'package:news_app_demo_flutter/newsfeature/NewsListPage.dart';

void main() {
  runApp(const ProviderCubitWidget(app: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: NewsListPage(),
    );
  }
}