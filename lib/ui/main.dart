import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdbap/providers/movie_provider.dart';
import 'package:tmdbap/routes.dart';
import 'package:tmdbap/ui/mainpage.dart';
import 'package:tmdbap/ui/saved_page.dart';

import 'details_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Movies App',
        theme: ThemeData.dark(),
       // home: MainPageWidget(),
        initialRoute: Routes.mainPage,
        routes: <String, WidgetBuilder>{
          Routes.mainPage: (BuildContext context) => new MainPageWidget(),
          Routes.savedPage: (BuildContext context) => new SavedPage(),
          Routes.detailsPage: (BuildContext context) => new DetailsPage(),
        });
  }
}
