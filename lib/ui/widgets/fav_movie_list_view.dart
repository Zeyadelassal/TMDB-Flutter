import 'package:flutter/material.dart';
import 'package:tmdbap/data_access_layer/model/Movie.dart';

import 'fav_movie_list_item.dart';
import 'movie_list_item.dart';

class FavMovieListView extends StatelessWidget {

  final List<Result> movies ;

  FavMovieListView({
    Key key, this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_,int movieIndex) => FavMovieListItem(
        movie: movies[movieIndex],
        context: context,
      ),
      separatorBuilder: (_, __) =>
          Divider(
            color: Colors.red,
            height: 5,
          ),
      itemCount: movies.length,);
  }
}