import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdbap/providers/movie_provider.dart';
import 'package:tmdbap/routes.dart';
import 'package:tmdbap/ui/widgets/movie_list_view.dart';

class MainPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainPage();
}

class MainPage extends State<MainPageWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MovieProvider>(
      create: (_) => MovieProvider(),
      child: BuildMainPage(),
    );
  }
}

class BuildMainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<BuildMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Movie Library",
            style: TextStyle(color: Colors.red),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                  Icons.list,
              color: Colors.red,
              ),
              onPressed: _pushSaved,
            ),
          ]),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Consumer<MovieProvider>(
              builder: (_, MovieProvider movieProvider, child) {
            if (Provider.of<MovieProvider>(context, listen: true)
                .movies
                .isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return MovieListView(movies: movieProvider.movies);
            }
          }),
        ),
      ),
    );
  }

  _pushSaved(){
    MovieProvider provider =
    Provider.of<MovieProvider>(context, listen: false);
    Navigator.of(context).pushNamed(Routes.savedPage, arguments: provider.savedMovies);
  }
}
