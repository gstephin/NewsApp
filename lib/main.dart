import 'package:flutter/material.dart';
import 'package:flutter_ui_test/news/news_screen.dart';
import 'package:flutter_ui_test/news/providers/news_provider.dart';
import 'package:flutter_ui_test/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: News(),
        ),
      ],
      child: MaterialApp(
        title: 'Ui Test App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Homepage(),
        routes: {
          NewsScreen.routeName: (ctx) => NewsScreen(),
        },
      ),
    );
  }
}
