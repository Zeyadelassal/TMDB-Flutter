import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdbap/data_access_layer/model/Movie.dart';
import 'package:tmdbap/providers/movie_provider.dart';

class FavoriteIcon extends StatefulWidget {
  Result movie;

  FavoriteIcon({this.movie});

  @override
  State<StatefulWidget> createState() =>
      FavoriteIconState(movie: movie);
}

class FavoriteIconState extends State<FavoriteIcon> {
  Result movie;

  FavoriteIconState({this.movie});

  @override
  Widget build(BuildContext context) {
    MovieProvider provider = Provider.of<MovieProvider>(context, listen: true);
    final bool isFav = provider.savedTitles.contains(movie.title);

    return InkWell(
        child: Icon(
          isFav ? Icons.favorite : Icons.favorite_border,
          color: Colors.redAccent,
        ),
        onTap: () {
          setState(() {
            if (isFav) {
              provider.removeFromSaved(movie);
            } else {
              provider.addToSaved(movie);
            }
          });
          print(provider.savedTitles.length);
        });
  }
}
