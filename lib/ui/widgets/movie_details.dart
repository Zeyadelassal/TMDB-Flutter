import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tmdbap/data_access_layer/model/Movie.dart';
import 'package:tmdbap/data_access_layer/model/genres.dart';

class MovieDetails extends StatelessWidget {

  final Result movie;

  const MovieDetails({
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
              fontSize: 14.0,
            ),
          ) ,
        ),
        Text(
          movie.releaseDate.toString(),
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
          ),
        ),
        Row(
          children:[
            ...movie.genreIds.map((movieGenre) => Card(
              shadowColor: Colors.red,
              color: Colors.red,
              child: Text(
                Genres.genresMap[movieGenre],
                style: TextStyle(
                    color: Colors.black
                ),
              ),
            )).take(3).toList()
          ]
        ),
        Text(
          movie.voteAverage.toString(),
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 12.0
          ),
        )
      ],
    );
  }

//  List<Widget> getGenres(){
//    return movie.genreIds.map((movieGenre) => Card(
//      shadowColor: Colors.red,
//      color: Colors.red,
//      child: Text(
//        Genres.genresMap[movieGenre],
//        style: TextStyle(
//            color: Colors.black
//        ),
//      ),
//    )).take(3).toList();
//  }
}