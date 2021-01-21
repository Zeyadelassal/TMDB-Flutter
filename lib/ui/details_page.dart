import 'package:flutter/material.dart';
import 'package:tmdbap/data_access_layer/model/Movie.dart';
import 'package:tmdbap/data_access_layer/model/genres.dart';

class DetailsPage extends StatelessWidget {
  //final Result movie;

  //DetailsPage(this.movie);

  @override
  Widget build(BuildContext context) {
    Result movie = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie.title,
          style: TextStyle(color: Colors.red),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.black,
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Hero(
                        tag: movie.id.toString(),
                        child: Image(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500/' +
                                  movie.posterPath),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 250,
                            child: Text(
                              movie.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.red),
                            ),
                          ),
                          Text(
                            movie.releaseDate.substring(0, 4),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.red),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          ...movie.genreIds.map((movieGenre) => ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: Card(
                                elevation: 20,
                                borderOnForeground: true,
                                color: Colors.red,
                                child: Text(
                                  Genres.genresMap[movieGenre],
                                  style: TextStyle(color: Colors.black),
                                ),
                              )))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Description',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        movie.overview,
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
