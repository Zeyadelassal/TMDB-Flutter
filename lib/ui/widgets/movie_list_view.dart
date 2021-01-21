import 'package:flutter/material.dart';
import 'package:tmdbap/data_access_layer/model/Movie.dart';

import 'movie_list_item.dart';

class MovieListView extends StatelessWidget {

  final List<Result> movies ;
  final Set<Movie> favMovies = Set<Movie>();

   MovieListView({
    Key key, this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_,int movieIndex) => MovieListItem(
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