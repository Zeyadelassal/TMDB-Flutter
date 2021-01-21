import 'package:flutter/material.dart';
import 'package:tmdbap/data_access_layer/model/Movie.dart';
import 'package:tmdbap/data_access_layer/model/genres.dart';

class FavMovieDetails extends StatelessWidget {

  final Result movie;

  const FavMovieDetails({
    Key key, this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width : 200,
          child: Text(
            movie.title,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ) ,
        ),
        Text(
          movie.releaseDate.toString().substring(0,4),
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}