import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdbap/data_access_layer/model/Movie.dart';
import 'package:tmdbap/ui/widgets/fav_movie_list_view.dart';


class SavedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Result> _savedMovies = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Movies',
        style: TextStyle(
          color: Colors.red
        ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FavMovieListView(
              movies: _savedMovies,
            ),
          )
        ],
      ),
    );
  }
}
