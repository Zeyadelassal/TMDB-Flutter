import 'package:flutter/material.dart';
import 'package:tmdbap/data_access_layer/model/Movie.dart';
import 'package:tmdbap/routes.dart';
import 'package:tmdbap/ui/widgets/fav_icon.dart';
import 'package:tmdbap/ui/widgets/movie_details.dart';
import 'package:tmdbap/ui/widgets/movie_image.dart';
import 'package:flutter/scheduler.dart' show timeDilation;


class MovieListItem extends StatelessWidget {
  final Result movie;
  final BuildContext context;

  const MovieListItem({
    this.movie, this.context
});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        timeDilation = 2.0;
        _pushSaved();
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
            children: <Widget>[
              Hero(
                tag:movie.id.toString(),
                child: MovieImage(
                  size: 100,
                  url: 'https://image.tmdb.org/t/p/w500/' + movie.posterPath
                ),
              ),
              SizedBox(
                  width: 10
              ),
              MovieDetails(
                movie: movie,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FavoriteIcon(movie:
                    movie),
                ),
              )
            ]),
      ),
    );
  }

  void _pushSaved(){
//    Navigator.of(context).push(
//        MaterialPageRoute<void>(
//            builder: (context){
//              return DetailsPage(movie);
//            }
//        )
//    );
    Navigator.of(context).pushNamed(Routes.detailsPage, arguments: movie);
  }
}