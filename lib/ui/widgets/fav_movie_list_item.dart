import 'package:flutter/material.dart';
import 'package:tmdbap/data_access_layer/model/Movie.dart';
import 'package:tmdbap/routes.dart';
import 'package:tmdbap/ui/widgets/fav_icon.dart';
import 'package:tmdbap/ui/widgets/fav_movie_details.dart';
import 'package:tmdbap/ui/widgets/movie_details.dart';
import 'package:tmdbap/ui/widgets/movie_image.dart';

class FavMovieListItem extends StatelessWidget {
  final Result movie;
  final BuildContext context;

  const FavMovieListItem({this.movie, this.context});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(children: <Widget>[
        MovieImage(
            size: 100,
            url: 'https://image.tmdb.org/t/p/w500/' + movie.posterPath),
        SizedBox(width: 10),
        FavMovieDetails(
          movie: movie,
        ),
      ]),
    );
  }
}
